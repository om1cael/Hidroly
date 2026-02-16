import 'package:hidroly/features/setup/domain/setup_constraints.dart';
import 'package:hidroly/features/setup/domain/unit_systems.dart';
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
  
  void setUnitSystem(UnitSystem selection) {
    state = state.copyWith(
      unit: {selection},
    );
  }

  String? validateAge(String? ageText, String errorText) {
    if(ageText == null || ageText.isEmpty) return null;

    final minAge = SetupConstraints.minAge;
    final maxAge = SetupConstraints.maxAge;

    int age = int.parse(ageText);
    return (age < minAge || age > maxAge) ? errorText : null;
  }

  String? validateWeight(String? weighText, String errorText) {
    if(weighText == null || weighText.isEmpty) return null;

    int weight = int.parse(weighText);
    return (weight < state.minWeight || weight > state.maxWeight) ? errorText : null;
  }
}