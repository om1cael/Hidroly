import 'package:hidroly/core/data/repositories/settings_repository_impl.dart';
import 'package:hidroly/core/ui/state/health_connect_settings_state.dart';
import 'package:hidroly/infra/health_connect/health_connect_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'health_connect_settings_card_view_model.g.dart';

@riverpod
class HealthConnectSettingsCardViewModel extends _$HealthConnectSettingsCardViewModel {
  @override
  Future<HealthConnectSettingsState> build() async {
    final settingsRepository = ref.read(settingsRepositoryProvider);

    return HealthConnectSettingsState(
      enabled: await settingsRepository.readHealthConnect()
    );
  }

  void changeSyncState(bool enabled) async {
    state = await AsyncValue.guard(() async => state.requireValue.copyWith(enabled: enabled));
    await ref.read(settingsRepositoryProvider).saveHealthConnect(state.requireValue.enabled);

    if(enabled) {
      handleSyncEnable();
    } else {
      handleSyncDisabled();
    }
  }

  void handleSyncEnable() async {
    await ref
      .read(healthConnectServiceProvider)
      .askForReadWritePermission();
  }

  void handleSyncDisabled() async {
    await ref
      .read(healthConnectServiceProvider)
      .revokePermissions();
  }
}