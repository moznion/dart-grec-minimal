import 'package:grec_minimal/src/exception/illegal_argument_exception.dart';

/// Weekday represents the weekdays of recurrence rule.
enum Weekday {
  MO,
  TU,
  WE,
  TH,
  FR,
  SA,
  SU,
}

/// WeekdayOperator is an operator for Weekday enum.
class WeekdayOperator {
  /// getSimpleName returns the simple name of a Weekday enum item.
  static String getSimpleName(final Weekday weekday) {
    switch (weekday) {
      case Weekday.MO:
        return 'MO';
      case Weekday.TU:
        return 'TU';
      case Weekday.WE:
        return 'WE';
      case Weekday.TH:
        return 'TH';
      case Weekday.FR:
        return 'FR';
      case Weekday.SA:
        return 'SA';
      case Weekday.SU:
        return 'SU';
    }

    // unreachable
    throw new IllegalArgumentException(
        'invalid weekday is given; something wrong in the library');
  }

  static final Map<String, Weekday> _str2weekday = new Map.fromIterable(
      Weekday.values,
      key: (v) => getSimpleName(v),
      value: (v) => v);

  /// fromString returns the Weekday enum item according to given argument.
  static Weekday fromString(final String given) {
    final Weekday weekday = _str2weekday[given];
    if (weekday == null) {
      throw new IllegalArgumentException(
          'invalid weekday string is given: ${given}');
    }

    return weekday;
  }
}
