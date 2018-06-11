import 'package:grec_minimal/grec_minimal.dart';

void main() {
  final List<String> ruleTexts = GrecMinimal.toTexts([
    new RecurrenceRule(Frequency.DAILY, 123, null, 2, null),
    // put recurrence rule object as you like
  ]);

  ruleTexts.forEach((ruleText) {
    // do something
    print(ruleText);
  });
}
