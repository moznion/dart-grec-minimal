class ParseResult<T> {
  ParseResult(this._remain, this._value);

  final String _remain;
  final T _value;

  String getRemain() => _remain;

  T getValue() => _value;
}
