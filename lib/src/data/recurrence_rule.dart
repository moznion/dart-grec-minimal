import 'package:grec_minimal/src/data/byday.dart';
import 'package:grec_minimal/src/exception/conditional_exception.dart';
import 'package:grec_minimal/src/symbol/frequency.dart';
import 'package:grec_minimal/src/symbol/weekday.dart';

/// RecurrenceRule is a data type that represents recurrence rule of calendar.
class RecurrenceRule {
  RecurrenceRule(
    this._frequency,
    this._count,
    this._until,
    this._interval,
    this._byday,
    this._bymonthday,
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

  final Frequency _frequency;
  final int _count;
  final DateTime _until;
  final int _interval;
  final Byday _byday;
  final List<int> _bymonthday;

  /// getFrequency returns frequency of recurrence that is specified by FREQ.
  Frequency getFrequency() => _frequency;

  /// getCount returns count of recurrence that is specified by COUNT.
  int getCount() => _count;

  /// getUntil returns until of recurrence that is specified by UNTIL.
  DateTime getUntil() => _until;

  /// getInterval returns interval of recurrence that is specified by INTERVAL.
  int getInterval() => _interval;

  /// getByday returns byday of recurrence that is specified by BYDAY.
  Byday getByday() => _byday;

  /// getBymonthday returns bymonthday of recurrence that is specified by BYMONTHDAY.
  List<int> getBymonthday() => _bymonthday;

  /// asRuleText dumps the rule as a text.
  String asRuleText() {
    final StringBuffer sb = new StringBuffer(
        'RRULE:FREQ=${FrequencyOperator.getSimpleName(_frequency)}');

    if (_count != null) {
      sb.write(';COUNT=$_count');
    }

    if (_until != null) {
      final String untilStr = _until
          .toIso8601String()
          .replaceAll(new RegExp(r'(?:[-:]|[.]000)'), '');
      sb.write(';UNTIL=$untilStr');
      if (!untilStr.endsWith('Z')) {
        sb.write('Z');
      }
    }

    if (_interval != null) {
      sb.write(';INTERVAL=$_interval');
    }

    if (_byday != null) {
      final int nth = _byday.getNth();
      final String weekdays =
          _byday.getWeekday().map(WeekdayOperator.getSimpleName).join(',');
      sb.write(';BYDAY=${nth ?? ''}$weekdays');
    }

    if (_bymonthday != null) {
      sb.write(';BYMONTHDAY=${_bymonthday.join(",")}');
    }

    return sb.toString();
  }
}
