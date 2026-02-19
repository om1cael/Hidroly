import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hidroly/features/setup/domain/entities/person.dart';
import 'package:hidroly/features/setup/domain/setup_stage.dart';
import 'package:hidroly/features/setup/domain/unit_systems.dart';

part 'setup_state.freezed.dart';

@freezed
abstract class SetupState with _$SetupState {
  const factory SetupState({
    required Person person,
    @Default(SetupStage.idle) SetupStage setupStage,
    required Set<UnitSystem> unit,
    String? errorText,
    @Default(false) bool dailyGoalClamped,
  }) = _SetupState;
}