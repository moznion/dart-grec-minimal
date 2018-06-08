import 'package:grec_minimal/src/exception/invalid_syntax_exception.dart';
import 'package:grec_minimal/src/parser/parsable.dart';
import 'package:grec_minimal/src/parser/parse_result.dart';

class UntilParser implements Parsable<DateTime> {
  static final RegExp _untilRE = new RegExp(r'UNTIL=([0-9]{8}T[0-9]{6}Z);?');

  @override
  ParseResult<DateTime> parse(final String subject) {
    final Iterable<Match> matches = _untilRE.allMatches(subject);

    if (matches.isEmpty) {
      return new ParseResult(subject, null);
    }

    if (matches.length >= 2) {
      throw new InvalidSyntaxException(
          'syntax error: `UNTIL` can appear to once at most.');
    }

    final Match untilMatched = matches.single;
    return new ParseResult(
      subject.replaceAll(_untilRE, ''),
      DateTime.parse(untilMatched.group(1)),
    );
  }
}
