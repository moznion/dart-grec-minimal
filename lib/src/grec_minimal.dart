import 'package:grec_minimal/src/data/recurrence_rule.dart';
import 'package:grec_minimal/src/parser/recurrence_rule_parser.dart';

/// GrecMinimal is an entry point of the library.
/// This class provides parser and generator for recurrence rule of Google Calendar.
class GrecMinimal {
  /// fromTexts parses and converts the recurrence rule text(s) to recurrence rule object(s).
  static List<RecurrenceRule> fromTexts(final List<String> texts) =>
      texts.map(RecurrenceRuleParser.parse).toList();

  /// toTexts generates the recurrence rule text(s) from recurrence rule object(s).
  static List<String> toTexts(final List<RecurrenceRule> rules) =>
      rules.map((RecurrenceRule r) => r.asRuleText()).toList();
}
