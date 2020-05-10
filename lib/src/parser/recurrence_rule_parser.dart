import 'package:grec_minimal/src/data/byday.dart';
import 'package:grec_minimal/src/data/recurrence_rule.dart';
import 'package:grec_minimal/src/parser/byday_parser.dart';
import 'package:grec_minimal/src/parser/bymonthday_parser.dart';
import 'package:grec_minimal/src/parser/count_parser.dart';
import 'package:grec_minimal/src/parser/frequency_parser.dart';
import 'package:grec_minimal/src/parser/interval_parser.dart';
import 'package:grec_minimal/src/parser/parse_result.dart';
import 'package:grec_minimal/src/parser/rrule_parser.dart';
import 'package:grec_minimal/src/parser/until_parser.dart';
import 'package:grec_minimal/src/symbol/frequency.dart';

class RecurrenceRuleParser {
  static RecurrenceRule parse(final String given) {
    // starts with `RRULE:`
    String remain = new RruleParser().parse(given).getRemain();

    // FREQ
    final ParseResult<Frequency> freqResult =
        new FrequencyParser().parse(remain);
    remain = freqResult.getRemain();

    // BYDAY
    final ParseResult<Byday> bydayResult = new BydayParser().parse(remain);
    remain = bydayResult.getRemain();

    // COUNT
    final ParseResult<int> countResult = new CountParser().parse(remain);
    remain = countResult.getRemain();

    // INTERVAL
    final ParseResult<int> intervalResult = new IntervalParser().parse(remain);
    remain = intervalResult.getRemain();

    // UNTIL
    final ParseResult<DateTime> untilResult = new UntilParser().parse(remain);
    remain = untilResult.getRemain();

    // BYMONTHDAY
    final ParseResult<List<int>> bymonthdayResult =
        new BymonthdayParser().parse(remain);
    remain = bymonthdayResult.getRemain();

    return new RecurrenceRule(
      freqResult.getValue(),
      countResult.getValue(),
      untilResult.getValue(),
      intervalResult.getValue(),
      bydayResult.getValue(),
      bymonthdayResult.getValue(),
    );
  }
}
