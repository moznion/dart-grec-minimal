import './parsable.dart';
import './parse_result.dart';
import '../symbol/frequency.dart';

class FrequencyParser implements Parsable<Frequency> {
  static final RegExp _freqRE = new RegExp(r'FREQ=([^;]+);?');

  @override
  ParseResult<Frequency> parse(final String subject) {
    final Iterable<Match> matches = _freqRE.allMatches(subject);

    try {
      final Match freqMatched = matches.single;
      return new ParseResult(
        subject.replaceAll(_freqRE, ''),
        FrequencyOperator.fromString(freqMatched.group(1)),
      );
    } catch (err) {
      if (matches.isEmpty) {
        throw 'invalid: FREQ is mandatory'; // TODO msg
      }

      throw 'invalid: prohibit multiple'; // TODO msg
    }
  }
}
