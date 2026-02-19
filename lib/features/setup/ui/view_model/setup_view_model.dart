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
      unit: {UnitSystem.metric},
    );
  }

  Future<void> completeSetup(int age, int weightValue) async {
    if(state.setupStage != .idle) return;

    Weight weight = _getWeight(weightValue);
    final person = Person(age: age, weight: weight);

    try {
      state = state.copyWith(setupStage: .processing);

      final setupResult = await ref.read(completeSetupUseCaseProvider)
        .execute(person);

      state = state.copyWith(
        dailyGoalClamped: setupResult.rawDailyGoal > setupResult.clampedGoal,
        setupStage: .success,
      );
    } on Exception catch (e) {
      // TODO: Catch error and show user-friendly message
      state = state.copyWith(
        setupStage: .error,
      );
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