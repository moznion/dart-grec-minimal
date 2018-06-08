import 'package:grec_minimal/src/data/byday.dart';
import 'package:grec_minimal/src/exception/conditional_exception.dart';
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
      throw new ConditionalException(
          '`FREQ` is missing. the parameter is mandatory');
    }

    if (_byday != null &&
        _byday.getNth() != null &&
        _byday.getWeekday().length >= 2) {
      throw new ConditionalException(
          'conflicted. it is prohibited to specify `Nth` of `BYDAY` with multiple weekdays.');
    }

    if (_count != null && _until != null) {
      throw new ConditionalException(
          'conflicted. it is prohibited to specify `COUNT` and `UNTIL` together.');
    }

    if (_frequency == Frequency.DAILY && _byday != null) {
      throw new ConditionalException(
          'conflicted. it is prohibited to specify `BYDAY` when `FREQ` is DAILY.');
    }

    if (_frequency == Frequency.WEEKLY &&
        _byday != null &&
        _byday.getNth() != null) {
      throw new ConditionalException(
          'conflicted. it is prohibited to specify `Nth` of `BYDAY` when `FREQ` is WEEKLY.');
    }

    if (_frequency == Frequency.YEARLY && _byday != null) {
      throw new ConditionalException(
          'conflicted. it is prohibited to specify `BYDAY` when `FREQ` is YEARLY.');
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
      if (!untilStr.endsWith('Z')) {
        text += 'Z';
      }
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
      text += ';BYDAY=${nth ?? ''}${weekdays}';
    }

    return text;
  }
}
