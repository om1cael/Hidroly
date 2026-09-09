import 'package:hidroly/core/ui/state/health_connect_backfill_state.dart';
import 'package:hidroly/core/ui/state/health_connect_settings_state.dart';
import 'package:hidroly/features/hydration/data/repositories/history_item_repository_impl.dart';
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

  Future<void> exportEntries() async {
    final historyItems = await ref.read(historyItemRepositoryProvider)
      .readFromAllDays();
    
    final healthConnectService = ref.read(healthConnectServiceProvider);

    try {
      state = await AsyncValue.guard(() async => state.requireValue.copyWith(backfillState: HealthConnectBackfillState.processing()));

      for(final item in historyItems) {
        await healthConnectService.writeHydrationData(
          double.parse(item.amount.ml.toString()), 
          item.createdAt, 
          item.id.toString()
        );
      }

      state = await AsyncValue.guard(() async => state.requireValue.copyWith(backfillState: HealthConnectBackfillState.idle()));
    } on Exception catch (_) {
      state = await AsyncValue.guard(() async => state.requireValue.copyWith(backfillState: HealthConnectBackfillState.error()));
    }
  }
}