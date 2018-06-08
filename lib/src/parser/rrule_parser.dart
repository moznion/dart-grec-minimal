import 'package:grec_minimal/src/parser/parsable.dart';
import 'package:grec_minimal/src/parser/parse_result.dart';

class RruleParser implements Parsable<dynamic> {
  static final RegExp _startRE = new RegExp(r'^RRULE:');

  @override
  ParseResult<dynamic> parse(final String subject) {
    if (!_startRE.hasMatch(subject)) {
      throw 'invalid sequence'; // TODO msg
    }

    final String remain = subject.replaceFirst(_startRE, '');

    return new ParseResult(remain, null);
  }
}
