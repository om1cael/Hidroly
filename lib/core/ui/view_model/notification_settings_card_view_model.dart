import 'package:flutter/material.dart';
import 'package:hidroly/core/data/repositories/settings_repository_impl.dart';
import 'package:hidroly/core/ui/state/notification_settings_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notification_settings_card_view_model.g.dart';

@riverpod
class NotificationSettingsCardViewModel extends _$NotificationSettingsCardViewModel {
  @override
  NotificationSettingsState build() => NotificationSettingsState();

  void saveSettings() async {
    final settingsRepository = ref.read(settingsRepositoryProvider);

    await Future.wait([
      settingsRepository.saveWakeUpTime(state.wakeUpTime),
      settingsRepository.saveSleepTime(state.sleepTime),
      settingsRepository.saveNotificationFrequency(state.notificationFrequency),
    ]);
  }

  void setWakeUpTime(TimeOfDay wakeUpTime, [bool persist = false]) {
    state = state.copyWith(wakeUpTime: wakeUpTime);

    if(persist) saveSettings();
  }

  void setSleepTime(TimeOfDay sleepTime, [bool persist = false]) {
    state = state.copyWith(sleepTime: sleepTime);

    if(persist) saveSettings();
  }

  void setNotificationFrequency(int frequency, [bool persist = false]) {
    state = state.copyWith(notificationFrequency: frequency);

    if(persist) saveSettings();
  }
}