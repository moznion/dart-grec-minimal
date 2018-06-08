import 'package:grec_minimal/src/data/byday.dart';
import 'package:grec_minimal/src/exception/condition_exception.dart';
import 'package:grec_minimal/src/symbol/frequency.dart';
import 'package:grec_minimal/src/symbol/weekday.dart';

class RecurrenceRule {
  final Frequency _frequency;
  final int _count;
  final DateTime _until;
  final int _interval;
  final Byday _byday;

  RecurrenceRule(
    this._frequency,
    this._count,
    this._until,
    this._interval,
    this._byday,
  ) {
    if (_frequency == null) {
      throw new ConditionException(
          '`FREQ` is missing. the parameter is mandatory');
    }

    if (_byday.getNth() != null && _byday.getWeekday().length >= 2) {
      throw new ConditionException(
          'conflicted. it is prohibited to specify `Nth` with multiple weekdays.');
    }

    if (_count != null && _until != null) {
      throw new ConditionException(
          'conflicted. it is prohibited to specify `COUNT` and `UNTIL` together.');
    }
  }

  Frequency getFrequency() => _frequency;

  int getCount() => _count;

  DateTime getUntil() => _until;

  int getInterval() => _interval;

  Byday getByday() => _byday;

  String asRuleText() {
    String text = 'RRULE:FREQ=${FrequencyOperator.getSimpleName(_frequency)}';

    if (_count != null) {
      text += ';COUNT=${_count}';
    }

    if (_until != null) {
      final String untilStr = _until
          .toIso8601String()
          .replaceAll(new RegExp(r'(?:[-:]|[.]000)'), '');
      text += ';UNTIL=${untilStr}';
    }

    if (_interval != null) {
      text += ';INTERVAL=${_interval}';
    }

    if (_byday != null) {
      final int nth = _byday.getNth();
      final String weekdays = _byday
          .getWeekday()
          .map((w) => WeekdayOperator.getSimpleName(w))
          .join(',');
      text += ';BYDAY=${nth}${weekdays}';
    }

    return text;
  }
}
