import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hidroly/core/ui/state/health_connect_backfill_state.dart';

part 'health_connect_settings_state.freezed.dart';

@freezed
abstract class HealthConnectSettingsState with _$HealthConnectSettingsState {
  const factory HealthConnectSettingsState({
    @Default(false) bool enabled,
    @Default(false) bool askForAppSettingsRedirect,
    @Default(HealthConnectBackfillState.idle()) HealthConnectBackfillState backfillState,
  }) = _HealthConnectSettingsState;
}