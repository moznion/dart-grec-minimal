class ParseResult<T> {
  final String _remain;
  final T _value;

  ParseResult(this._remain, this._value);

  String getRemain() => _remain;

  T getValue() => _value;
}
