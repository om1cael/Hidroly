import 'package:hidroly/core/ui/state/health_connect_settings_state.dart';
import 'package:hidroly/infra/health_connect/health_connect_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'health_connect_settings_card_view_model.g.dart';

@riverpod
class HealthConnectSettingsCardViewModel extends _$HealthConnectSettingsCardViewModel {
  @override
  Future<HealthConnectSettingsState> build() async {
    final healthConnectService = ref.read(healthConnectServiceProvider);

    return HealthConnectSettingsState(
      enabled: await healthConnectService.hasPermissions()
    );
  }

  void changeSyncState(bool enabled) async {
    state = await AsyncValue.guard(() async => state.requireValue.copyWith(askForAppSettingsRedirect: false));

    if(enabled) {
      await handleSyncEnable();
    } else {
      await handleSyncDisabled();
    }
  }

  Future<void> handleSyncEnable() async {
    bool success = await ref
      .read(healthConnectServiceProvider)
      .askForReadWritePermission();
    
    if(!success) {
      state = await AsyncValue.guard(() async => state.requireValue.copyWith(askForAppSettingsRedirect: true));
    }

    ref.invalidateSelf();
  }

  Future<void> handleSyncDisabled() async {
    await ref
      .read(healthConnectServiceProvider)
      .revokePermissions();

    state = await AsyncValue.guard(() async => state.requireValue.copyWith(enabled: false));
  }
}