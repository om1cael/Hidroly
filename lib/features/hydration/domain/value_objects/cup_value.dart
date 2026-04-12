import 'package:hidroly/core/domain/enums/unit_systems.dart';
import 'package:hidroly/core/domain/exceptions/invalid_input_exception.dart';
import 'package:hidroly/features/hydration/domain/value_objects/water.dart';

class CupValue {
  final int value;

  const CupValue._internal(this.value);

  static final int minValue = 50;
  static final int maxValue = 1000;

  static int get minValueOz => (minValue / 29.574).round();
  static int get maxValueOz => (maxValue / 29.574).round();

  factory CupValue.ml(int value) {
    if(value < minValue || value > maxValue) {
      throw InvalidInputException();
    }

    return CupValue._internal(value);
  }

  factory CupValue.fromOz(int value) {
    int ml = (value * 29.574).round();
    return CupValue.ml(ml);
  }

  Water toWater() =>
    Water.ml(value);

  static int minValueFor(UnitSystem unit) => unit == UnitSystem.metric
    ? minValue
    : minValueOz;
  
  static int maxValueFor(UnitSystem unit) => unit == UnitSystem.metric
    ? maxValue
    : maxValueOz;
}