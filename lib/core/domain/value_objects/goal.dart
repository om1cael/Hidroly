import 'package:hidroly/core/domain/enums/unit_systems.dart';
import 'package:hidroly/core/domain/exceptions/invalid_input_exception.dart';
import 'package:hidroly/core/domain/hydration_constraints.dart';

class Goal {
  final int ml;

  const Goal.min() : ml = HydrationConstraints.minAllowedWaterMl; 
  const Goal._internal(this.ml);

  factory Goal.ml(int value) {
    if(value < HydrationConstraints.minAllowedWaterMl || value > HydrationConstraints.maxAllowedWaterMl) {
      throw InvalidInputException();
    }

    return Goal._internal(value);
  }

  factory Goal.fromOz(int value) {
    int ml = (value * 29.574).round();
    return Goal.ml(ml);
  }

  int valueIn(UnitSystem unitSystem) => 
    unitSystem == UnitSystem.metric
      ? ml
      : (ml / 29.574).round();
}