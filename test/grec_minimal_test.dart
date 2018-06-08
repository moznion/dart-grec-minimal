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

  group('invalid cases', () {
    test('should raise exception when head of `RRULE:` is missing', () {
      Exception err;
      try {
        GrecMinimal.fromTexts(['FREQ=DAILY']);
      } catch (e) {
        err = e;
      }

      expect(err, isNotNull);
      expect(err is InvalidSyntaxException, isTrue);
      expect(err.toString(),
          'syntax error: rule text must be started with `RRULE:`.');
    });

    test('should raise exception when head of `RRULE:` is missing', () {
      Exception err;
      try {
        GrecMinimal.fromTexts(['FREQ=DAILY']);
      } catch (e) {
        err = e;
      }

      expect(err, isNotNull);
      expect(err is InvalidSyntaxException, isTrue);
      expect(err.toString(),
          'syntax error: rule text must be started with `RRULE:`.');
    });

    test('should raise exception when `FREQ` is missing', () {
      Exception err;
      try {
        GrecMinimal.fromTexts(['RRULE:COUNT=123']);
      } catch (e) {
        err = e;
      }

      expect(err, isNotNull);
      expect(err is ConditionalException, isTrue);
      expect(err.toString(), '`FREQ` is missing. the parameter is mandatory');
    });

    test('should raise exception when `FREQ` appears multiple', () {
      Exception err;
      try {
        GrecMinimal.fromTexts(['RRULE:FREQ=DAILY;FREQ=WEEKLY']);
      } catch (e) {
        err = e;
      }

      expect(err, isNotNull);
      expect(err is InvalidSyntaxException, isTrue);
      expect(
          err.toString(), 'syntax error: `FREQ` can appear to once at most.');
    });

    test('should raise exception when `BYDAY` appears multiple', () {
      Exception err;
      try {
        GrecMinimal.fromTexts(['RRULE:FREQ=WEEKLY;BYDAY=TU;BYDAY=WE']);
      } catch (e) {
        err = e;
      }

      expect(err, isNotNull);
      expect(err is InvalidSyntaxException, isTrue);
      expect(
          err.toString(), 'syntax error: `BYDAY` can appear to once at most.');
    });

    test('should raise exception when `COUNT` appears multiple', () {
      Exception err;
      try {
        GrecMinimal.fromTexts(['RRULE:FREQ=DAILY;COUNT=1;COUNT=2']);
      } catch (e) {
        err = e;
      }

      expect(err, isNotNull);
      expect(err is InvalidSyntaxException, isTrue);
      expect(
          err.toString(), 'syntax error: `COUNT` can appear to once at most.');
    });

    test('should raise exception when `INTERVAL` appears multiple', () {
      Exception err;
      try {
        GrecMinimal.fromTexts(['RRULE:FREQ=DAILY;INTERVAL=2;INTERVAL=3']);
      } catch (e) {
        err = e;
      }

      expect(err, isNotNull);
      expect(err is InvalidSyntaxException, isTrue);
      expect(err.toString(),
          'syntax error: `INTERVAL` can appear to once at most.');
    });

    test('should raise exception when `UNTIL` appears multiple', () {
      Exception err;
      try {
        GrecMinimal.fromTexts(
            ['RRULE:FREQ=DAILY;UNTIL=20180912T235959Z;UNTIL=20190912T235959Z']);
      } catch (e) {
        err = e;
      }

      expect(err, isNotNull);
      expect(err is InvalidSyntaxException, isTrue);
      expect(
          err.toString(), 'syntax error: `UNTIL` can appear to once at most.');
    });
  });
}
