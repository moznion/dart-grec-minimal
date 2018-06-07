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
      expect(() => WeekdayOperator.getSimpleName(null),
          throwsA('invalid weekday is given; something wrong in the library'));
    });
  });
}
