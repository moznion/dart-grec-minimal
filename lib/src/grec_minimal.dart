import 'package:grec_minimal/src/data/recurrence_rule.dart';
import 'package:grec_minimal/src/parser/recurrence_rule_parser.dart';

/// TODO doc
class GrecMinimal {
  static List<RecurrenceRule> fromTexts(final List<String> texts) {
    return texts.map((text) => RecurrenceRuleParser.parse(text));
  }

  static List<String> toTexts(final List<RecurrenceRule> rules) {
    return rules.map((r) => r.asRuleText());
  }
}
