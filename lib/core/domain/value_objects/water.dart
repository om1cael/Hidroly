import 'package:hidroly/core/domain/enums/unit_systems.dart';
import 'package:hidroly/core/domain/exceptions/invalid_input_exception.dart';

class Water {
  final int ml;

  const Water.zero() : ml = 0; 
  const Water._internal(this.ml);

  static final int minValue = 1;

  factory Water.ml(int value) {
    if(value < minValue) {
      throw InvalidInputException();
    }

    return Water._internal(value);
  }

  factory Water.fromOz(int value) {
    int ml = (value * 29.574).round();
    return Water.ml(ml);
  }

  int valueIn(UnitSystem unitSystem) => 
    unitSystem == UnitSystem.metric
      ? ml
      : (ml / 29.574).round();
}