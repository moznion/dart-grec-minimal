import 'package:grec_minimal/src/parser/parse_result.dart';

abstract class Parsable<T> {
  ParseResult<T> parse(final String subject);
}
