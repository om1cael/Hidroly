import 'package:hidroly/core/domain/entities/day.dart';
import 'package:hidroly/core/domain/repositories/day_repository.dart';
import 'package:hidroly/features/setup/domain/entities/person.dart';
import 'package:hidroly/features/setup/domain/setup_constraints.dart';

class CompleteSetupUseCase {
  final DayRepository _repository;

  const CompleteSetupUseCase(this._repository);
  
  Future<int> execute(Person person) async {
    final rawDailyGoal = person.calculateHydrationGoalMl();
    final clampedGoal = rawDailyGoal.clamp(
      SetupConstraints.minWaterSuggestionMl, 
      SetupConstraints.maxWaterSuggestionMl,
    );

    final day = Day(
      dailyGoal: clampedGoal, 
      createdAt: DateTime.now(),
    );

    await _repository.save(day);
    return clampedGoal;
  }
}