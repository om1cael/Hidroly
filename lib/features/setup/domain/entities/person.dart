import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hidroly/features/setup/domain/value_objects/weight.dart';

part 'person.freezed.dart';

@freezed
class Person with _$Person {
  const Person({
    required this.age,
    required this.weight,
  });

  @override final int age;
  @override final Weight weight;

  int calculateHydrationGoalMl() {
    int mlPerKg = _getMlPerKg();
    return mlPerKg * weight.kg;
  }

  int _getMlPerKg() {
    if(age < 18) {
      return 40;
    } else if(age < 55) {
      return 35;
    } else if(age <= 65) {
      return 30;
    }

    return 25;
  }
}