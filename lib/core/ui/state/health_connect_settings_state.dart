import 'package:freezed_annotation/freezed_annotation.dart';

part 'health_connect_settings_state.freezed.dart';

@freezed
abstract class HealthConnectSettingsState with _$HealthConnectSettingsState {
  const factory HealthConnectSettingsState({
    @Default(false) bool enabled,
  }) = _HealthConnectSettingsState;
}