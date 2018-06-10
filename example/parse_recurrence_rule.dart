import 'package:grec_minimal/grec_minimal.dart';

main() {
  final List<String> recurrenceRuleTexts = [
    'RRULE:FREQ=DAILY',
    // put recurrence rule texts
  ];
  final List<RecurrenceRule> rules = GrecMinimal.fromTexts(recurrenceRuleTexts);

  rules.forEach((rule) {
    // do something
    print(rule.asRuleText());
  });
}
