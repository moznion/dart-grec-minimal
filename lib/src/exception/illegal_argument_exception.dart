import 'package:grec_minimal/src/exception/grec_minimal_exception.dart';

/// IllegalArgumentException raises when given argument is invalid.
class IllegalArgumentException extends GrecMinimalException {
  final String _cause;

  IllegalArgumentException(this._cause);

  @override
  String toString() => _cause;
}
