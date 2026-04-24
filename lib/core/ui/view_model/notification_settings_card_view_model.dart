import 'package:flutter/material.dart';
import 'package:hidroly/core/data/repositories/settings_repository_impl.dart';
import 'package:hidroly/core/providers/local_notification_service_provider.dart';
import 'package:hidroly/core/providers/translation_provider.dart';
import 'package:hidroly/core/ui/state/notification_settings_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notification_settings_card_view_model.g.dart';

@riverpod
class NotificationSettingsCardViewModel extends _$NotificationSettingsCardViewModel {
  @override
  Future<NotificationSettingsState> build() async {
    final settingsRepository = ref.read(settingsRepositoryProvider);

    return NotificationSettingsState(
      wakeUpTime: await settingsRepository.readWakeUpTime(),
      sleepTime: await settingsRepository.readSleepTime(),
      notificationFrequency: await settingsRepository.readNotificationFrequency(),
    );
  }

  void saveSettings() async {
    final settingsRepository = ref.read(settingsRepositoryProvider);
    final translationProvider = ref.read(translationProviderProvider);

    await Future.wait([
      settingsRepository.saveWakeUpTime(state.requireValue.wakeUpTime),
      settingsRepository.saveSleepTime(state.requireValue.sleepTime),
      settingsRepository.saveNotificationFrequency(state.requireValue.notificationFrequency),
    ]);

    final notificationTitle = 
      translationProvider.translate('notificationTitle');
    
    final notificationBody =
      translationProvider.translate('notificationBody');

    ref
      .read(localNotificationServiceProvider)
      .setUpScheduler(notificationTitle, notificationBody, state.requireValue.notificationFrequency);
  }

  void setWakeUpTime(TimeOfDay wakeUpTime, [bool persist = true]) async {
    state = await AsyncValue.guard(() async => state.requireValue.copyWith(wakeUpTime: wakeUpTime));

    if(persist) saveSettings();
  }

  void setSleepTime(TimeOfDay sleepTime, [bool persist = true]) async {
    state = await AsyncValue.guard(() async => state.requireValue.copyWith(sleepTime: sleepTime));

    if(persist) saveSettings();
  }

  void setNotificationFrequency(int frequency, [bool persist = true]) async {
    state = await AsyncValue.guard(() async => state.requireValue.copyWith(notificationFrequency: frequency));

    if(persist) saveSettings();
  }
}