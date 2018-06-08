import 'package:grec_minimal/src/exception/grec_minimal_exception.dart';

class ConditionalException implements GrecMinimalException {
  final String _cause;

  ConditionalException(this._cause);

  @override
  String toString() => _cause;
}
