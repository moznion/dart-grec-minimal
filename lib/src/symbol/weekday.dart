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
}
