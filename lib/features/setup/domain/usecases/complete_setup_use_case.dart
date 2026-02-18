import 'package:hidroly/features/setup/domain/entities/person.dart';
import 'package:hidroly/features/setup/domain/setup_constraints.dart';

class CompleteSetupUseCase {
  // TODO: save with repository
  int execute(Person person) {
    final rawDailyGoal = person.calculateHydrationGoalMl();
    final clampedGoal = rawDailyGoal.clamp(
      SetupConstraints.minWaterSuggestionMl, 
      SetupConstraints.maxWaterSuggestionMl,
    );

    return clampedGoal;
  }
}