import 'package:hidroly/features/setup/domain/exceptions/invalid_weight_exception.dart';

class Weight {
  final int kg;

  const Weight({required this.kg});
  
  static final int minWeight = 35;
  static final int maxWeight = 150;

  factory Weight.kg(int kg) {
    if(kg < minWeight || kg > maxWeight) {
      throw InvalidWeightException();
    }

    return Weight(kg: kg);
  }

  factory Weight.fromLb(int lb) {
    int kg = (lb / 2.205).round();
    return Weight.kg(kg);
  }
}