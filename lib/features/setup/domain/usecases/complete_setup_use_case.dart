import 'package:hidroly/core/data/repositories/day_repository_impl.dart';
import 'package:hidroly/core/domain/entities/day.dart';
import 'package:hidroly/core/domain/repositories/day_repository.dart';
import 'package:hidroly/features/setup/domain/entities/person.dart';
import 'package:hidroly/features/setup/domain/setup_constraints.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'complete_setup_use_case.g.dart';

@riverpod
CompleteSetupUseCase completeSetupUseCase(Ref ref) {
  final dayRepository = ref.watch(dayRepositoryProvider);
  return CompleteSetupUseCase(dayRepository);
}

class CompleteSetupUseCase {
  final DayRepository _repository;

  const CompleteSetupUseCase(this._repository);
  
  Future<({int rawDailyGoal, int clampedGoal})> execute(Person person) async {
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
    return (rawDailyGoal: rawDailyGoal, clampedGoal: clampedGoal);
  }
}