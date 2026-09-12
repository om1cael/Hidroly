import 'package:hidroly/core/data/repositories/settings_repository_impl.dart';
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
}