import './parse_result.dart';

abstract class Parsable<T> {
  ParseResult<T> parse(final String subject);
}
