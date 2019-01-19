import 'package:grec_minimal/src/exception/grec_minimal_exception.dart';

/// ConditionalException raises when recurrence rule has any conflicted states.
class ConditionalException implements GrecMinimalException {
  ConditionalException(this._cause);

  final String _cause;

  @override
  String toString() => _cause;
}
