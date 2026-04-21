import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_settings_state.freezed.dart';

@freezed
abstract class NotificationSettingsState with _$NotificationSettingsState {
  const factory NotificationSettingsState({
    @Default(TimeOfDay(hour: 8, minute: 0)) TimeOfDay wakeUpTime,
    @Default(TimeOfDay(hour: 21, minute: 0)) TimeOfDay sleepTime,
    @Default(2) int notificationFrequency,
  }) = _NotificationSettingsState;
}