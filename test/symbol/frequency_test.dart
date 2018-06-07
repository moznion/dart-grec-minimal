import 'package:test/test.dart';
import 'package:grec_minimal/grec_minimal.dart';

void main() {
  group('For .getSimpleName()', () {
    test('should get simple name of DAILY', () {
      expect(FrequencyOperator.getSimpleName(Frequency.DAILY), 'DAILY');
    });
    test('should get simple name of WEEKLY', () {
      expect(FrequencyOperator.getSimpleName(Frequency.WEEKLY), 'WEEKLY');
    });
    test('should get simple name of MONTHLY', () {
      expect(FrequencyOperator.getSimpleName(Frequency.MONTHLY), 'MONTHLY');
    });
    test('should get simple name of YEARLY', () {
      expect(FrequencyOperator.getSimpleName(Frequency.YEARLY), 'YEARLY');
    });
    test('should fail to get simple name with invalid value', () {
      expect(
          () => FrequencyOperator.getSimpleName(null),
          throwsA(equals(
              'invalid frequency is given; something wrong in the library')));
    });
  });

  group('For .fromString()', () {
    test('should get DAILY enum item', () {
      expect(FrequencyOperator.fromString('DAILY'), Frequency.DAILY);
    });
    test('should get WEEKLY enum item', () {
      expect(FrequencyOperator.fromString('WEEKLY'), Frequency.WEEKLY);
    });
    test('should get MONTHLY enum item', () {
      expect(FrequencyOperator.fromString('MONTHLY'), Frequency.MONTHLY);
    });
    test('should get YEARLY enum item', () {
      expect(FrequencyOperator.fromString('YEARLY'), Frequency.YEARLY);
    });
    test('should fail to get enum item', () {
      expect(() => FrequencyOperator.fromString('INVALID'),
          throwsA(equals('invalid frequency string is given: INVALID')));
    });
  });
}
