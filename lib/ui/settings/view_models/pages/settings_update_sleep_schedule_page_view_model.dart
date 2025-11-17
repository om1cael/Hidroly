import 'package:flutter/material.dart';
import 'package:hidroly/domain/models/enum/frequency.dart';
import 'package:hidroly/domain/models/enum/settings.dart';
import 'package:hidroly/provider/settings_provider.dart';

class SettingsUpdateSleepSchedulePageViewModel {
  final SettingsProvider _settingsProvider;

  const SettingsUpdateSleepSchedulePageViewModel({
    required SettingsProvider settingsProvider,
  }) : _settingsProvider = settingsProvider;

  Future<void> updateSettings(TimeOfDay wakeUpTime, TimeOfDay sleepTime, Frequency newFrequency) async {
    await _settingsProvider.updateTime(
      Settings.wakeUpTime, 
      wakeUpTime.hour, 
      wakeUpTime.minute,
    );

    await _settingsProvider.updateTime(
      Settings.sleepTime, 
      sleepTime.hour, 
      sleepTime.minute,
    );

    await _settingsProvider.updateFrequency(newFrequency.frequency);
  }
}