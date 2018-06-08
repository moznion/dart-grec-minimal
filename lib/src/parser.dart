import './data/byday.dart';
import './parser/byday_parser.dart';
import './parser/frequency_parser.dart';
import './parser/parse_result.dart';
import './symbol/frequency.dart';

class Parser {
  static final RegExp _startRE = new RegExp(r'^RRULE:');

  static parse(final String text) {
    if (!_startRE.hasMatch(text)) {
      throw 'invalid sequence'; // TODO msg
    }

    // here is striped `RRULE:`
    String remain = text.replaceFirst(_startRE, '');

    final ParseResult<Frequency> freqResult = new FrequencyParser().parse(remain);
    remain = freqResult.getRemain();

    final ParseResult<Byday> bydayResult = new BydayParser().parse(remain);
    remain = bydayResult.getRemain();
  }
}
