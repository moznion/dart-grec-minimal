import 'package:grec_minimal/src/exception/grec_minimal_exception.dart';

class ParseException implements GrecMinimalException {
  final String _cause;

  ParseException(this._cause);

  @override
  String toString() => _cause;
}
