import 'package:grec_minimal/src/exception/illegal_argument_exception.dart';

enum Frequency {
  DAILY,
  WEEKLY,
  MONTHLY,
  YEARLY,
}

class FrequencyOperator {
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
