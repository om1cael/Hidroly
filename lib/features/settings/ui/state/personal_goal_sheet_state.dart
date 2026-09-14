import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hidroly/core/domain/enums/unit_systems.dart';

part 'personal_goal_sheet_state.freezed.dart';

@freezed
abstract class PersonalGoalSheetState with _$PersonalGoalSheetState {
  const factory PersonalGoalSheetState({
    @Default(UnitSystem.metric) UnitSystem unitSystem,
    @Default(false) bool goalOutsideBoundaries,
  }) = _PersonalGoalSheetState; 
}