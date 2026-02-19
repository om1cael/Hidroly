import 'package:hidroly/features/setup/domain/entities/person.dart';
import 'package:hidroly/features/setup/domain/exceptions/invalid_input_exception.dart';
import 'package:hidroly/features/setup/domain/unit_systems.dart';
import 'package:hidroly/features/setup/domain/usecases/complete_setup_use_case.dart';
import 'package:hidroly/features/setup/domain/value_objects/age.dart';
import 'package:hidroly/features/setup/domain/value_objects/weight.dart';
import 'package:hidroly/features/setup/ui/enums/input_status.dart';
import 'package:hidroly/features/setup/ui/state/setup_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'setup_view_model.g.dart';

@riverpod
class SetupViewModel extends _$SetupViewModel {
  @override 
  SetupState build() {
    return SetupState(
      person: Person(age: Age(18), weight: Weight(kg: 65)),
      unit: {UnitSystem.metric},
    );
  }

  Future<void> completeSetup(String ageText, String weightText) async {
    if(state.setupStage != .idle) return;

    try {
      int ageValue = int.tryParse(ageText) ?? 0;
      int weightValue = int.tryParse(weightText) ?? 0;

      Age age = Age(ageValue);
      Weight weight = _getWeight(weightValue);

      final person = Person(age: age, weight: weight);

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
  
  void setUnitSystem(UnitSystem selection) {
    state = state.copyWith(
      unit: {selection},
    );
  }

  InputStatus validateAge(String? ageText) {
    if(ageText == null || ageText.isEmpty) {
      return .noInput;
    }

    try {
      final ageValue = int.tryParse(ageText) ?? 0;
      final age = Age(ageValue);

      state = state.copyWith(person: Person(age: age, weight: state.person.weight));
      return .success;
    } on InvalidInputException {
      return .outOfBoundaries;
    }
  }

  InputStatus validateWeight(String? weighText) {
    if(weighText == null || weighText.isEmpty) {
      return .noInput;
    }

    try {
      final weightValue = int.tryParse(weighText) ?? 0;
      final weight = _getWeight(weightValue);

      state = state.copyWith(person: Person(age: state.person.age, weight: weight));
      return .success;
    } on InvalidInputException {
      return .outOfBoundaries;
    }
  }

  Weight _getWeight(int weightValue) {
    Weight weight;

    state.unit.first == UnitSystem.metric
      ? weight = Weight(kg: weightValue)
      : weight = Weight.fromLb(weightValue);

    return weight;
  }
}