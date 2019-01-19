import 'package:grec_minimal/src/exception/grec_minimal_exception.dart';

/// InvalidSyntaxException raises when recurrence rule sytax has something wrong.
class InvalidSyntaxException implements GrecMinimalException {
  InvalidSyntaxException(this._cause);

  final String _cause;

  @override
  String toString() => _cause;
}
