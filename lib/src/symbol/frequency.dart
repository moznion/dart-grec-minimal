import 'package:grec_minimal/src/exception/illegal_argument_exception.dart';

/// Frequency represents the frequency of recurrence rule.
enum Frequency {
  DAILY,
  WEEKLY,
  MONTHLY,
  YEARLY,
}

/// FrequencyOperator is an operator for Frequency enum.
class FrequencyOperator {
  /// getSimpleName returns the simple name of a Frequency enum item.
  static String getSimpleName(Frequency freq) {
    switch (freq) {
      case Frequency.DAILY:
        return 'DAILY';
      case Frequency.WEEKLY:
        return 'WEEKLY';
      case Frequency.MONTHLY:
        return 'MONTHLY';
      case Frequency.YEARLY:
        return 'YEARLY';
    }

    // unreachable
    throw new IllegalArgumentException(
        'invalid frequency is given; something wrong in the library');
  }

  /// fromString returns the Frequency enum item according to given argument.
  static Frequency fromString(final String given) {
    for (var v in Frequency.values) {
      // TODO perf
      if (given == getSimpleName(v)) {
        return v;
      }
    }

    throw new IllegalArgumentException(
        'invalid frequency string is given: ${given}');
  }
}
