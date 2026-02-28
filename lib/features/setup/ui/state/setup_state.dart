import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hidroly/core/domain/enums/process_stage.dart';

part 'setup_state.freezed.dart';

@freezed
abstract class SetupState with _$SetupState {
  const factory SetupState({
    @Default(ProcessStage.idle) ProcessStage stage,
    @Default(false) bool dailyGoalClamped,
  }) = _SetupState;
}