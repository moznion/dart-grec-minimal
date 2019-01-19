import 'package:grec_minimal/src/exception/grec_minimal_exception.dart';

/// IllegalArgumentException raises when given argument is invalid.
class IllegalArgumentException extends GrecMinimalException {
  IllegalArgumentException(this._cause);

  final String _cause;

  @override
  String toString() => _cause;
}
