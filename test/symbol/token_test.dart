import 'package:grec_minimal/src/exception/illegal_argument_exception.dart';
import 'package:test/test.dart';
import 'package:grec_minimal/src/symbol/token.dart';

void main() {
  group('for .getSimpleName', () {
    test('should get simple name of RRULE', () {
      expect(TokenOperator.getSimpleName(Token.RRULE), 'RRULE');
    });
    test('should get simple name of FREQ', () {
      expect(TokenOperator.getSimpleName(Token.FREQ), 'FREQ');
    });
    test('should get simple name of INTERNAL', () {
      expect(TokenOperator.getSimpleName(Token.INTERVAL), 'INTERVAL');
    });
    test('should get simple name of COUNT', () {
      expect(TokenOperator.getSimpleName(Token.COUNT), 'COUNT');
    });
    test('should get simple name of UNTIL', () {
      expect(TokenOperator.getSimpleName(Token.UNTIL), 'UNTIL');
    });
    test('should get simple name of BYDAY', () {
      expect(TokenOperator.getSimpleName(Token.BYDAY), 'BYDAY');
    });
    test('should fail to get simple name with invalid value', () {
      Exception err;
      try {
        TokenOperator.getSimpleName(null);
      } catch (e) {
        err = e;
      }

      expect(err, isNotNull);
      expect(err is IllegalArgumentException, isTrue);
      expect(err.toString(),
          equals('invalid token is given; something wrong in the library'));
    });
  });
}
