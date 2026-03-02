import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hidroly/core/domain/entities/hydration_goal.dart';
import 'package:hidroly/core/domain/hydration_constraints.dart';
import 'package:hidroly/core/domain/value_objects/age.dart';
import 'package:hidroly/core/domain/value_objects/weight.dart';

part 'person.freezed.dart';

@freezed
class Person with _$Person {
  const Person({
    required this.age,
    required this.weight,
  });

  @override final Age age;
  @override final Weight weight;

  HydrationGoal calculateHydrationGoalMl() {
    int mlPerKg = _getMlPerKg();

    int rawDailyGoal = mlPerKg * weight.kg;
    final clampedGoal = rawDailyGoal.clamp(
      HydrationConstraints.minWaterSuggestionMl, 
      HydrationConstraints.maxWaterSuggestionMl,
    );

    return HydrationGoal(rawDailyGoal: rawDailyGoal, clampedGoal: clampedGoal);
  }

  int _getMlPerKg() {
    if(age.value < 18) {
      return 40;
    } else if(age.value < 55) {
      return 35;
    } else if(age.value <= 65) {
      return 30;
    }

    return 25;
  }
}