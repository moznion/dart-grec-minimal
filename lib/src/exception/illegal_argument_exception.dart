import 'package:grec_minimal/src/exception/grec_minimal_exception.dart';

class IllegalArgumentException extends GrecMinimalException {
  final String _cause;

  IllegalArgumentException(this._cause);

  @override
  String toString() => _cause;
}
