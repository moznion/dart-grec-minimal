import 'package:grec_minimal/src/exception/invalid_syntax_exception.dart';
import 'package:grec_minimal/src/parser/parsable.dart';
import 'package:grec_minimal/src/parser/parse_result.dart';

class RruleParser implements Parsable<dynamic> {
  static final RegExp _startRE = new RegExp(r'^RRULE:');

  @override
  ParseResult<dynamic> parse(final String subject) {
    if (!_startRE.hasMatch(subject)) {
      throw new InvalidSyntaxException(
          'syntax error: rule text must be started with `RRULE:`.');
    }

    final String remain = subject.replaceFirst(_startRE, '');

    return new ParseResult(remain, null);
  }
}
