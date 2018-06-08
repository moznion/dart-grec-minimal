enum Weekday {
  MO,
  TU,
  WE,
  TH,
  FR,
  SA,
  SU,
}

class WeekdayOperator {
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
    throw 'invalid weekday is given; something wrong in the library';
  }

  static Weekday fromString(final String given) {
    for (var v in Weekday.values) {
      // TODO perf
      if (given == getSimpleName(v)) {
        return v;
      }
    }

    throw 'invalid weekday string is given: ${given}';
  }
}
