import 'package:flutter/material.dart';
import 'package:hidroly/core/ui/state/notification_settings_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notification_settings_card_view_model.g.dart';

@riverpod
class NotificationSettingsCardViewModel extends _$NotificationSettingsCardViewModel {
  @override
  NotificationSettingsState build() => NotificationSettingsState();

  void setWakeUpTime(TimeOfDay wakeUpTime) {
    state = state.copyWith(wakeUpTime: wakeUpTime);
  }

  void setSleepTime(TimeOfDay sleepTime) {
    state = state.copyWith(sleepTime: sleepTime);
  }

  void setNotificationFrequency(int frequency) {
    state = state.copyWith(notificationFrequency: frequency);
  }
}