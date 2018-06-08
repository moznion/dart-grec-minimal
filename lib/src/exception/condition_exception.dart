import 'package:grec_minimal/src/exception/grec_minimal_exception.dart';

class ConditionException implements GrecMinimalException {
  final String _cause;

  ConditionException(this._cause);

  @override
  String toString() => _cause;
}
