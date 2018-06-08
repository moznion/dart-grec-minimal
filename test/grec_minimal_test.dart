import 'package:grec_minimal/grec_minimal.dart';
import 'package:test/test.dart';

void main() {
  test('daily', () {
    final List<String> texts = [
      'RRULE:FREQ=DAILY',
      'RRULE:FREQ=DAILY;COUNT=30',
      'RRULE:FREQ=DAILY;UNTIL=20180712T145959Z',
      'RRULE:FREQ=DAILY;INTERVAL=2',
      'RRULE:FREQ=DAILY;COUNT=30;INTERVAL=2',
      'RRULE:FREQ=DAILY;UNTIL=20180712T145959Z;INTERVAL=2',
    ];
    final List<RecurrenceRule> rules = GrecMinimal.fromTexts(texts);
    expect(GrecMinimal.toTexts(rules), texts);
  });

  test('weekly', () {
    final List<String> texts = [
      'RRULE:FREQ=WEEKLY;BYDAY=MO',
      'RRULE:FREQ=WEEKLY;COUNT=13;BYDAY=TU',
      'RRULE:FREQ=WEEKLY;UNTIL=20180911T145959Z;BYDAY=TU',
      'RRULE:FREQ=WEEKLY;INTERVAL=2',
      'RRULE:FREQ=WEEKLY;INTERVAL=2;BYDAY=MO,TU,TH,SA',
      'RRULE:FREQ=WEEKLY;COUNT=13;INTERVAL=2;BYDAY=MO,TU,TH,SA',
      'RRULE:FREQ=WEEKLY;UNTIL=20180908T145959Z;INTERVAL=2;BYDAY=MO,TU,TH,SA',
      'RRULE:FREQ=WEEKLY;COUNT=13;INTERVAL=2;BYDAY=FR',
      'RRULE:FREQ=WEEKLY;UNTIL=20180904T145959Z;INTERVAL=2;BYDAY=TU',
      'RRULE:FREQ=WEEKLY;BYDAY=MO,TU,WE,TH,FR',
    ];

    final List<RecurrenceRule> rules = GrecMinimal.fromTexts(texts);
    expect(GrecMinimal.toTexts(rules), texts);
  });

  test('monthly', () {
    final List<String> texts = [
      'RRULE:FREQ=MONTHLY',
      'RRULE:FREQ=MONTHLY;COUNT=12',
      'RRULE:FREQ=MONTHLY;BYDAY=2MO',
      'RRULE:FREQ=MONTHLY;COUNT=12;BYDAY=2TU',
      'RRULE:FREQ=MONTHLY;UNTIL=20190611T145959Z;BYDAY=2TU',
      'RRULE:FREQ=MONTHLY;UNTIL=20190612T145959Z',
      'RRULE:FREQ=MONTHLY;INTERVAL=2',
      'RRULE:FREQ=MONTHLY;COUNT=12;INTERVAL=2',
      'RRULE:FREQ=MONTHLY;INTERVAL=2;BYDAY=2TU',
      'RRULE:FREQ=MONTHLY;COUNT=12;INTERVAL=2;BYDAY=2TU',
      'RRULE:FREQ=MONTHLY;UNTIL=20190611T145959Z;INTERVAL=2;BYDAY=2TU',
      'RRULE:FREQ=MONTHLY;UNTIL=20190612T145959Z;INTERVAL=2',
    ];

    final List<RecurrenceRule> rules = GrecMinimal.fromTexts(texts);
    expect(GrecMinimal.toTexts(rules), texts);
  });

  test('yearly', () {
    final List<String> texts = [
      'RRULE:FREQ=YEARLY',
      'RRULE:FREQ=YEARLY;INTERVAL=2',
      'RRULE:FREQ=YEARLY;COUNT=5;INTERVAL=2',
      'RRULE:FREQ=YEARLY;UNTIL=20220612T145959Z;INTERVAL=2',
    ];

    final List<RecurrenceRule> rules = GrecMinimal.fromTexts(texts);
    expect(GrecMinimal.toTexts(rules), texts);
  });
}
