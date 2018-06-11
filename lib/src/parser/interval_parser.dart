import 'package:grec_minimal/src/exception/invalid_syntax_exception.dart';
import 'package:grec_minimal/src/parser/parsable.dart';
import 'package:grec_minimal/src/parser/parse_result.dart';

class IntervalParser implements Parsable<int> {
  static final RegExp _intervalRE = new RegExp(r'INTERVAL=([0-9]+);?');

  @override
  ParseResult<int> parse(final String subject) {
    final Iterable<Match> matches = _intervalRE.allMatches(subject);

    if (matches.isEmpty) {
      return new ParseResult<int>(subject, null);
    }

    if (matches.length >= 2) {
      throw new InvalidSyntaxException(
          'syntax error: `INTERVAL` can appear to once at most.');
    }

    final Match intervalMatched = matches.single;
    return new ParseResult<int>(
      subject.replaceAll(_intervalRE, ''),
      int.parse(intervalMatched.group(1), radix: 10),
    );
  }
}
