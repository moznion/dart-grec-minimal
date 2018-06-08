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

  /// fromString returns the Weekday enum item according to given argument.
  static Weekday fromString(final String given) {
    for (var v in Weekday.values) {
      // TODO perf
      if (given == getSimpleName(v)) {
        return v;
      }
    }

    throw new IllegalArgumentException(
        'invalid weekday string is given: ${given}');
  }
}
