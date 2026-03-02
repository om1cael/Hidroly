import 'package:hidroly/core/domain/entities/person.dart';
import 'package:hidroly/core/domain/exceptions/invalid_input_exception.dart';
import 'package:hidroly/core/domain/enums/unit_systems.dart';
import 'package:hidroly/core/domain/value_objects/age.dart';
import 'package:hidroly/core/domain/value_objects/weight.dart';
import 'package:hidroly/core/ui/enums/input_status.dart';
import 'package:hidroly/core/ui/state/hydration_form_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hydration_form_view_model.g.dart';

@riverpod
class HydrationFormViewModel extends _$HydrationFormViewModel {
  @override 
  HydrationFormState build() {
    return HydrationFormState(
      unit: {UnitSystem.metric},
    );
  }

  Person mapToPerson(String ageText, String weightText) {
    int ageValue = int.tryParse(ageText) ?? 0;
    int weightValue = int.tryParse(weightText) ?? 0;

    return Person(
      age: Age(ageValue), 
      weight: _getWeight(weightValue),
    );
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
    return state.unit.first == UnitSystem.metric
      ? Weight.kg(weightValue)
      : Weight.fromLb(weightValue);
  }
}