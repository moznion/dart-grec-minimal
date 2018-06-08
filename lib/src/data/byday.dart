import 'package:grec_minimal/src/symbol/weekday.dart';

/// Byday is a data type that represents BYDAY node.
class Byday {
  final List<Weekday> _weekday;
  final int _nth;

  Byday(this._weekday, this._nth);

  /// getWeekday returns a list of weekday(s) that is specified by BYDAY.
  List<Weekday> getWeekday() => _weekday;

  /// getNth returns a Nth specifier (to specify Nth weekday).
  int getNth() => _nth;
}
