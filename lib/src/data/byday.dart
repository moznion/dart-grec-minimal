import 'package:grec_minimal/src/symbol/weekday.dart';

class Byday {
  final List<Weekday> _weekday;
  final int _nth;

  Byday(this._weekday, this._nth);

  List<Weekday> getWeekday() => _weekday;

  int getNth() => _nth;
}
