import 'package:grec_minimal/grec_minimal.dart';

void main() {
  final List<String> recurrenceRuleTexts = [
    'RRULE:FREQ=DAILY',
    // put recurrence rule texts
  ];

  List<RecurrenceRule> rules;
  try {
    rules = GrecMinimal.fromTexts(recurrenceRuleTexts);
  } catch (ex) {
    // There is possibility to occur InvalidSyntaxException and/or ConditionalException
    // do something
    rethrow;
  }

  rules.forEach((rule) {
    // do something
    print(rule.asRuleText());
  });
}
