enum Token {
  RRULE,
  FREQ,
  INTERVAL,
  COUNT,
  UNTIL,
  BYDAY,
}

class TokenOperator {
  static String getSimpleName(final Token token) {
    switch (token) {
      case Token.RRULE:
        return 'RRULE';
      case Token.FREQ:
        return 'FREQ';
      case Token.INTERVAL:
        return 'INTERVAL';
      case Token.COUNT:
        return 'COUNT';
      case Token.UNTIL:
        return 'UNTIL';
      case Token.BYDAY:
        return 'BYDAY';
    }

    // unreachable
    throw 'invalid token is given; something wrong in the library'; }
}
