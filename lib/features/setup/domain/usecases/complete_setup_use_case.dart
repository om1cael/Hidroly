import 'package:hidroly/core/data/repositories/day_repository_impl.dart';
import 'package:hidroly/core/data/repositories/settings_repository_impl.dart';
import 'package:hidroly/core/domain/entities/day.dart';
import 'package:hidroly/core/domain/entities/hydration_goal.dart';
import 'package:hidroly/core/domain/entities/person.dart';
import 'package:hidroly/core/domain/enums/unit_systems.dart';
import 'package:hidroly/core/domain/repositories/day_repository.dart';
import 'package:hidroly/core/domain/repositories/settings_repository.dart';
import 'package:hidroly/features/hydration/domain/value_objects/water.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'complete_setup_use_case.g.dart';

@riverpod
CompleteSetupUseCase completeSetupUseCase(Ref ref) {
  final dayRepository = ref.watch(dayRepositoryProvider);
  final settingsRepository = ref.watch(settingsRepositoryProvider);

  return CompleteSetupUseCase(dayRepository, settingsRepository);
}

class CompleteSetupUseCase {
  final DayRepository _dayRepository;
  final SettingsRepository _settingsRepository;

  const CompleteSetupUseCase(this._dayRepository, this._settingsRepository);
  
  Future<HydrationGoal> execute(Person person, UnitSystem unitSystem) async {
    final dailyGoal = person.calculateHydrationGoalMl();

    final day = Day(
      dailyGoal: Water.ml(dailyGoal.clampedGoal), 
      createdAt: DateTime.now(),
    );

    await _dayRepository.save(day);
    await _settingsRepository.saveUnitSystem(unitSystem);
    return dailyGoal;
  }
}