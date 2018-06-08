import 'package:test/test.dart';
import 'package:grec_minimal/grec_minimal.dart';

void main() {
  group('for .getSimpleName', () {
    test('should get simple name of MO', () {
      expect(WeekdayOperator.getSimpleName(Weekday.MO), 'MO');
    });
    test('should get simple name of TU', () {
      expect(WeekdayOperator.getSimpleName(Weekday.TU), 'TU');
    });
    test('should get simple name of WE', () {
      expect(WeekdayOperator.getSimpleName(Weekday.WE), 'WE');
    });
    test('should get simple name of TH', () {
      expect(WeekdayOperator.getSimpleName(Weekday.TH), 'TH');
    });
    test('should get simple name of FR', () {
      expect(WeekdayOperator.getSimpleName(Weekday.FR), 'FR');
    });
    test('should get simple name of SA', () {
      expect(WeekdayOperator.getSimpleName(Weekday.SA), 'SA');
    });
    test('should get simple name of SU', () {
      expect(WeekdayOperator.getSimpleName(Weekday.SU), 'SU');
    });
    test('should fail to get simple name with invalid value', () {
      Exception err;
      try {
        WeekdayOperator.getSimpleName(null);
      } catch (e) {
        err = e;
      }

      expect(err, isNotNull);
      expect(err is IllegalArgumentException, isTrue);
      expect(err.toString(),
          equals('invalid weekday is given; something wrong in the library'));
    });
  });

  group('For .fromString()', () {
    test('should get MO enum item', () {
      expect(WeekdayOperator.fromString('MO'), Weekday.MO);
    });
    test('should get MO enum item', () {
      expect(WeekdayOperator.fromString('TU'), Weekday.TU);
    });
    test('should get MO enum item', () {
      expect(WeekdayOperator.fromString('WE'), Weekday.WE);
    });
    test('should get MO enum item', () {
      expect(WeekdayOperator.fromString('TH'), Weekday.TH);
    });
    test('should get MO enum item', () {
      expect(WeekdayOperator.fromString('FR'), Weekday.FR);
    });
    test('should get MO enum item', () {
      expect(WeekdayOperator.fromString('SA'), Weekday.SA);
    });
    test('should get MO enum item', () {
      expect(WeekdayOperator.fromString('SU'), Weekday.SU);
    });
    test('should fail to get enum item', () {
      Exception err;
      try {
        WeekdayOperator.fromString('INVALID');
      } catch (e) {
        err = e;
      }

      expect(err, isNotNull);
      expect(err is IllegalArgumentException, isTrue);
      expect(
          err.toString(), equals('invalid weekday string is given: INVALID'));
    });
  });
}
