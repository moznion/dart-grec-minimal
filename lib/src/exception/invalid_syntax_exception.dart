import 'package:grec_minimal/src/exception/grec_minimal_exception.dart';

/// InvalidSyntaxException raises when recurrence rule sytax has something wrong.
class InvalidSyntaxException implements GrecMinimalException {
  final String _cause;

  InvalidSyntaxException(this._cause);

  @override
  String toString() => _cause;
}
