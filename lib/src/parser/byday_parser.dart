import 'package:grec_minimal/src/data/byday.dart';
import 'package:grec_minimal/src/exception/invalid_syntax_exception.dart';
import 'package:grec_minimal/src/parser/parsable.dart';
import 'package:grec_minimal/src/parser/parse_result.dart';
import 'package:grec_minimal/src/symbol/weekday.dart';

class BydayParser implements Parsable<Byday> {
  static final RegExp _bydayRE = new RegExp(r'BYDAY=(\d+)?([^;]+);?');

  @override
  ParseResult<Byday> parse(final String subject) {
    final Iterable<Match> matches = _bydayRE.allMatches(subject);

    if (matches.isEmpty) {
      return new ParseResult<Byday>(subject, null);
    }

    if (matches.length >= 2) {
      throw new InvalidSyntaxException(
          'syntax error: `BYDAY` can appear to once at most.');
    }

    final Match match = matches.first;
    final String nth = match.group(1);
    final List<String> weekdays = match.group(2).split(',');

    return new ParseResult<Byday>(
      subject.replaceAll(_bydayRE, ''),
      new Byday(
        weekdays.map(WeekdayOperator.fromString).toList(),
        nth == null ? null : int.parse(nth, radix: 10),
      ),
    );
  }
}
