import 'dart:developer';

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
      updatePerson(ageText, weightText);
      final person = state.person;

      state = state.copyWith(setupStage: .processing);
      final setupResult = await ref.read(completeSetupUseCaseProvider)
        .execute(person);

      state = state.copyWith(
        dailyGoalClamped: setupResult.rawDailyGoal > setupResult.clampedGoal,
        setupStage: .success,
      );
    } on Exception catch (e) {
      state = state.copyWith(
        setupStage: .error,
      );

      log(e.toString(), error: e);
    }
  }

  void updatePerson(String ageText, String weightText) {
    int ageValue = int.tryParse(ageText) ?? 0;
    int weightValue = int.tryParse(weightText) ?? 0;

    final person = Person(
      age: Age(ageValue), 
      weight: _getWeight(weightValue),
    );

    state = state.copyWith(person: person);
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
      Age(ageValue);

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
      _getWeight(weightValue);

      return .success;
    } on InvalidInputException {
      return .outOfBoundaries;
    }
  }

  Weight _getWeight(int weightValue) {
    Weight weight;

    state.unit.first == UnitSystem.metric
      ? weight = Weight.kg(weightValue)
      : weight = Weight.fromLb(weightValue);

    return weight;
  }
}