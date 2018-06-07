import './symbol/frequency.dart';
import './symbol/weekday.dart';

class Parser {
  static final RegExp _startRE = new RegExp(r'^RRULE:');

  static parse(final String text) {
    if (!_startRE.hasMatch(text)) {
      throw 'invalid sequence'; // TODO msg
    }

    // here is striped `RRULE:`
    String remain = text.replaceFirst(_startRE, '');

    final _ParseResult<Frequency> freqResult = _parseFREQ(remain);
    remain = freqResult.getRemain();

    final _ParseResult<_Byday> bydayResult = _parseBYDAY(remain);
    remain = bydayResult.getRemain();
  }

  static final RegExp _freqRE = new RegExp(r'FREQ=([^;]+);?');

  static _ParseResult<Frequency> _parseFREQ(final String remain) {
    final Iterable<Match> matches = _freqRE.allMatches(remain);

    try {
      final Match freqMatched = matches.single;
      return new _ParseResult(
        remain.replaceAll(_freqRE, ''),
        FrequencyOperator.fromString(freqMatched.group(1)),
      );
    } catch (err) {
      if (matches.isEmpty) {
        throw 'invalid: FREQ is mandatory'; // TODO msg
      }

      throw 'invalid: prohibit multiple'; // TODO msg
    }
  }

  static final RegExp _bydayRE = new RegExp(r'BYDAY=(\d+)?([^;]+);?');

  static _ParseResult<_Byday> _parseBYDAY(final String remain) {
    final Iterable<Match> matches = _bydayRE.allMatches(remain);

    if (matches.isEmpty) {
      return new _ParseResult(remain, null);
    }

    if (matches.length >= 2) {
      throw 'invalid: prohibit multiple'; // TODO msg
    }

    final Match match = matches.first;
    final String nth = match.group(1);
    final List<String> weekdays = match.group(2).split(',');

    if (weekdays.length >= 2 && nth != null) {
      throw 'conflict: nth specifier with multiple weekdays'; // TODO msg
    }
    return new _ParseResult(
      remain.replaceAll(_bydayRE, ''),
      new _Byday(
        weekdays.map((w) => WeekdayOperator.fromString(w)),
        nth == null ? null : int.parse(nth, radix: 10),
      ),
    );
  }
}

class _ParseResult<T> {
  final String _remain;
  final T _value;

  _ParseResult(this._remain, this._value);

  String getRemain() => _remain;

  T getValue() => _value;
}

class _Byday {
  final List<Weekday> _weekday;
  final int _nth;

  _Byday(this._weekday, this._nth);

  List<Weekday> getWeekday() => _weekday;

  int getNth() => _nth;
}
