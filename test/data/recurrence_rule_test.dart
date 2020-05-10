import 'package:grec_minimal/grec_minimal.dart';
import 'package:test/test.dart';

void main() {
  group('instantiate', () {
    test('should instantiate successfully', () {
      [
        new RecurrenceRule(Frequency.DAILY, null, null, null, null, null),
        new RecurrenceRule(
            Frequency.MONTHLY, 123, null, 2, new Byday([Weekday.MO], 2), null),
        new RecurrenceRule(Frequency.WEEKLY, null, new DateTime.now(), 2,
            new Byday([Weekday.MO, Weekday.FR], null), null),
      ].forEach((r) => expect(r is RecurrenceRule, isTrue));
    });

    test('should fail instantiate without frequency', () {
      Exception err;
      try {
        new RecurrenceRule(null, null, null, null, null, null);
      } catch (e) {
        err = e;
      }

      expect(err, isNotNull);
      expect(err is ConditionalException, isTrue);
      expect(err.toString(),
          equals('`FREQ` is missing. the parameter is mandatory'));
    });

    test('should fail instantiate with Nth and multiple weekdays', () {
      Exception err;
      try {
        new RecurrenceRule(Frequency.MONTHLY, null, null, null,
            new Byday([Weekday.MO, Weekday.TU], 2), null);
      } catch (e) {
        err = e;
      }

      expect(err, isNotNull);
      expect(err is ConditionalException, isTrue);
      expect(
          err.toString(),
          equals(
              'conflicted. it is prohibited to specify `Nth` of `BYDAY` with multiple weekdays.'));
    });

    test('should fail instantiate when both of count and until are not null',
        () {
      Exception err;
      try {
        new RecurrenceRule(Frequency.DAILY, 123, new DateTime.now(), 2,
            new Byday([Weekday.MO], 2), null);
      } catch (e) {
        err = e;
      }

      expect(err, isNotNull);
      expect(err is ConditionalException, isTrue);
      expect(
          err.toString(),
          equals(
              'conflicted. it is prohibited to specify `COUNT` and `UNTIL` together.'));
    });

    test(
        'should fail instantiate when `BYDAY` is specified even if frequency is DAILY',
        () {
      Exception err;
      try {
        new RecurrenceRule(Frequency.DAILY, null, null, null,
            new Byday([Weekday.MO], null), null);
      } catch (e) {
        err = e;
      }

      expect(err, isNotNull);
      expect(err is ConditionalException, isTrue);
      expect(
          err.toString(),
          equals(
              'conflicted. it is prohibited to specify `BYDAY` when `FREQ` is DAILY.'));
    });

    test(
        'should fail instantiate when `Nth` of `BYDAY` is specified even if frequency is WEEKLY',
        () {
      Exception err;
      try {
        new RecurrenceRule(Frequency.WEEKLY, null, null, null,
            new Byday([Weekday.MO], 2), null);
      } catch (e) {
        err = e;
      }

      expect(err, isNotNull);
      expect(err is ConditionalException, isTrue);
      expect(
          err.toString(),
          equals(
              'conflicted. it is prohibited to specify `Nth` of `BYDAY` when `FREQ` is WEEKLY.'));
    });

    test(
        'should fail instantiate when `BYDAY` is specified even if frequency is YEARLY',
        () {
      Exception err;
      try {
        new RecurrenceRule(Frequency.YEARLY, null, null, null,
            new Byday([Weekday.MO], null), null);
      } catch (e) {
        err = e;
      }

      expect(err, isNotNull);
      expect(err is ConditionalException, isTrue);
      expect(
          err.toString(),
          equals(
              'conflicted. it is prohibited to specify `BYDAY` when `FREQ` is YEARLY.'));
    });
  });

  group('.asRuleText', () {
    test('most simple case', () {
      expect(
          new RecurrenceRule(Frequency.DAILY, null, null, null, null, null)
              .asRuleText(),
          equals('RRULE:FREQ=DAILY'));
    });

    test('with count', () {
      expect(
          new RecurrenceRule(Frequency.DAILY, 10, null, null, null, null)
              .asRuleText(),
          equals('RRULE:FREQ=DAILY;COUNT=10'));
    });

    test('with until', () {
      final DateTime dt = new DateTime(2018, 6, 12, 20, 12, 32);
      expect(
          new RecurrenceRule(Frequency.DAILY, null, dt, null, null, null)
              .asRuleText(),
          equals('RRULE:FREQ=DAILY;UNTIL=20180612T201232Z'));
    });

    test('with interval', () {
      expect(
          new RecurrenceRule(Frequency.DAILY, null, null, 2, null, null)
              .asRuleText(),
          equals('RRULE:FREQ=DAILY;INTERVAL=2'));
    });

    test('with byday (single, wituhout Nth)', () {
      expect(
          new RecurrenceRule(Frequency.WEEKLY, null, null, null,
                  new Byday([Weekday.TU], null), null)
              .asRuleText(),
          equals('RRULE:FREQ=WEEKLY;BYDAY=TU'));
    });

    test('with byday (multi, wituhout Nth)', () {
      expect(
          new RecurrenceRule(
                  Frequency.WEEKLY,
                  null,
                  null,
                  null,
                  new Byday([
                    Weekday.MO,
                    Weekday.TU,
                    Weekday.WE,
                    Weekday.TH,
                    Weekday.FR
                  ], null),
                  null)
              .asRuleText(),
          equals('RRULE:FREQ=WEEKLY;BYDAY=MO,TU,WE,TH,FR'));
    });

    test('with byday (single, with Nth)', () {
      expect(
          new RecurrenceRule(Frequency.MONTHLY, null, null, null,
                  new Byday([Weekday.TU], 3), null)
              .asRuleText(),
          equals('RRULE:FREQ=MONTHLY;BYDAY=3TU'));
    });

    test('complex case', () {
      expect(
          new RecurrenceRule(Frequency.WEEKLY, 123, null, 2,
                  new Byday([Weekday.SA, Weekday.SU], null), null)
              .asRuleText(),
          equals('RRULE:FREQ=WEEKLY;COUNT=123;INTERVAL=2;BYDAY=SA,SU'));
    });

    test('with bymonthday', ()  {
      expect(
          new RecurrenceRule(Frequency.MONTHLY, null, null, null, null, [1,3,14]).asRuleText(),
          equals('RRULE:FREQ=MONTHLY;BYMONTHDAY=1,3,14'));
    });
  });
}
