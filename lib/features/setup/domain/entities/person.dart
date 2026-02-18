import 'package:freezed_annotation/freezed_annotation.dart';

part 'person.freezed.dart';

@freezed
class Person with _$Person {
  const Person({
    required this.age,
    required this.weightKg,
  });

  @override final int age;
  @override final int weightKg;

  int calculateHydrationGoalMl() {
    int mlPerKg = 40;

    if(age >= 18 && age < 55) {
      mlPerKg = 35;
    } else if(age >= 55 && age <= 65) {
      mlPerKg = 30;
    } else if(age >= 66) {
      mlPerKg = 25;
    }

    return mlPerKg * weightKg;
  }
}