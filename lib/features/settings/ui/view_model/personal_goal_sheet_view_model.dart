import 'package:hidroly/core/data/repositories/settings_repository_impl.dart';
import 'package:hidroly/core/domain/enums/unit_systems.dart';
import 'package:hidroly/core/domain/hydration_constraints.dart';
import 'package:hidroly/core/domain/value_objects/goal.dart';
import 'package:hidroly/core/domain/value_objects/water.dart';
import 'package:hidroly/core/ui/enums/input_status.dart';
import 'package:hidroly/features/settings/ui/state/personal_goal_sheet_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'personal_goal_sheet_view_model.g.dart';

@riverpod
class PersonalGoalSheetViewModel extends _$PersonalGoalSheetViewModel {
  @override
  Future<PersonalGoalSheetState> build() async {
    final unitSystem =
      await ref.read(settingsRepositoryProvider).readUnitSystem();

    return PersonalGoalSheetState(
      unitSystem: unitSystem,
    );
  }

  InputStatus validateGoal(String? content) {
    if(content == null || content.isEmpty) {
      return .noInput;
    }

    try {
      int value = int.tryParse(content) ?? 0;
      _getGoalValue(value);
    } catch (_) {
      return .outOfBoundaries;
    }

    return .success;
  }

  Goal _getGoalValue(int value) {
    return state.requireValue.unitSystem == UnitSystem.metric
      ? Goal.ml(value)
      : Goal.fromOz(value);
  }
}