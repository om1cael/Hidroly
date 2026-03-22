import 'package:hidroly/core/domain/enums/unit_systems.dart';

class Water {
  final int ml;

  const Water(this.ml);

  int valueIn(UnitSystem unitSystem) => 
    unitSystem == UnitSystem.metric
      ? ml
      : (ml / 29.574).round();
}