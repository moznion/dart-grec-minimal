import './parsable.dart';
import './parse_result.dart';
import '../symbol/weekday.dart';
import '../data/byday.dart';

class BydayParser implements Parsable<Byday> {
  static final RegExp _bydayRE = new RegExp(r'BYDAY=(\d+)?([^;]+);?');

  @override
  ParseResult<Byday> parse(final String subject) {
    final Iterable<Match> matches = _bydayRE.allMatches(subject);

    if (matches.isEmpty) {
      return new ParseResult(subject, null);
    }

    if (matches.length >= 2) {
      throw 'invalid: prohibit multiple'; // TODO msg
    }

    final Match match = matches.first;
    final String nth = match.group(1);
    final List<String> weekdays = match.group(2).split(',');

    if (weekdays.length >= 2 && nth != null) {
      throw 'conflict: nth specifier with multiple weekdays'; // TODO msg
    }
    return new ParseResult(
      subject.replaceAll(_bydayRE, ''),
      new Byday(
        weekdays.map((w) => WeekdayOperator.fromString(w)),
        nth == null ? null : int.parse(nth, radix: 10),
      ),
    );
  }
}
