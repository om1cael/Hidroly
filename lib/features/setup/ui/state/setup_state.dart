import 'package:freezed_annotation/freezed_annotation.dart';

part 'setup_state.freezed.dart';

@freezed
abstract class SetupState with _$SetupState {
  const factory SetupState.profile() = _Profile;
  const factory SetupState.notifications() = _Notifications;
  const factory SetupState.processing() = _Processing;
  const factory SetupState.done({@Default(false) bool dailyGoalClamped}) = _Done;
  const factory SetupState.error(String error) = _Error;
}