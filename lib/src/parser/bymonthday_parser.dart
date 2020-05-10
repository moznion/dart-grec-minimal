import 'package:grec_minimal/src/exception/invalid_syntax_exception.dart';
import 'package:grec_minimal/src/parser/parsable.dart';
import 'package:grec_minimal/src/parser/parse_result.dart';

class BymonthdayParser implements Parsable<List<int>> {
  static final RegExp _bymonthdayRE = new RegExp(r'BYMONTHDAY=([^;]+);?');

  @override
  ParseResult<List<int>> parse(final String subject) {
    final Iterable<Match> matches = _bymonthdayRE.allMatches(subject);

    if (matches.isEmpty) {
      return new ParseResult<List<int>>(subject, null);
    }

    if (matches.length >= 2) {
      throw new InvalidSyntaxException(
          'syntax error: `BYMONTHDAY` can appear to once at most.');
    }

    final Match match = matches.first;
    final List<String> days = match.group(1).split(',');

    return new ParseResult<List<int>>(
      subject.replaceAll(_bymonthdayRE, ''),
      days.map((String day) => int.parse(day, radix: 10)).toList(),
    );
  }
}
