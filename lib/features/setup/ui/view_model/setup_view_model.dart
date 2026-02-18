import 'package:hidroly/core/data/repositories/day_repository_impl.dart';
import 'package:hidroly/features/setup/domain/entities/person.dart';
import 'package:hidroly/features/setup/domain/setup_constraints.dart';
import 'package:hidroly/features/setup/domain/unit_systems.dart';
import 'package:hidroly/features/setup/domain/usecases/complete_setup_use_case.dart';
import 'package:hidroly/features/setup/domain/value_objects/weight.dart';
import 'package:hidroly/features/setup/ui/state/setup_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'setup_view_model.g.dart';

@riverpod
class SetupViewModel extends _$SetupViewModel {
  @override 
  SetupState build() {
    return SetupState(
      age: 0,
      weight: 0,
      unit: {UnitSystem.metric},
    );
  }

  void completeSetup(int age, int weightValue) async {
    final dayRepository = ref.watch(dayRepositoryProvider);

    Weight weight = _getWeight(weightValue);
    final person = Person(age: age, weight: weight);
    final useCase = CompleteSetupUseCase(dayRepository);

    int rawDailyGoal = person.calculateHydrationGoalMl();
    int dailyGoal = await useCase.execute(person);

    if(rawDailyGoal > dailyGoal) {
      state = state.copyWith(dailyGoalClamped: true);
    }
  }

  Weight _getWeight(int weightValue) {
    Weight weight = Weight(kg: weightValue);
    
    if(state.unit.first == UnitSystem.imperial) {
      weight = Weight.fromLb(weightValue);
    }

    return weight;
  }
  
  void setUnitSystem(UnitSystem selection) {
    state = state.copyWith(
      unit: {selection},
    );
  }

  String? validateAge(String? ageText, String emptyErrorText, String errorText) {
    if(ageText == null || ageText.isEmpty) {
      return emptyErrorText;
    }

    final minAge = SetupConstraints.minAge;
    final maxAge = SetupConstraints.maxAge;

    int? age = int.tryParse(ageText);
    if(age == null) return errorText;

    return (age < minAge || age > maxAge) ? errorText : null;
  }

  String? validateWeight(String? weighText, String emptyErrorText, String errorText) {
    if(weighText == null || weighText.isEmpty) {
      return emptyErrorText;
    }

    int? weight = int.tryParse(weighText);
    if(weight == null) return errorText;

    return (weight < state.minWeight || weight > state.maxWeight) ? errorText : null;
  }
}