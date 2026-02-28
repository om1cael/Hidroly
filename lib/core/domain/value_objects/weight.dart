import 'package:hidroly/core/domain/enums/unit_systems.dart';
import 'package:hidroly/core/domain/exceptions/invalid_input_exception.dart';

class Weight {
  final int kg;

  const Weight._internal(this.kg);
  
  static final int minWeight = 35;
  static final int maxWeight = 150;
  
  static int get minWeightLb => (minWeight * 2.205).round();
  static int get maxWeightLb => (maxWeight * 2.205).round();

  factory Weight.kg(int kg) {
    if(kg < minWeight || kg > maxWeight) {
      throw InvalidInputException();
    }

    return Weight._internal(kg);
  }

  factory Weight.fromLb(int lb) {
    int kg = (lb / 2.205).round();
    return Weight.kg(kg);
  }

  static int minWeightFor(UnitSystem unit) => unit == UnitSystem.metric
    ? minWeight
    : minWeightLb;
  
  static int maxWeightFor(UnitSystem unit) => unit == UnitSystem.metric
    ? maxWeight
    : maxWeightLb;
}