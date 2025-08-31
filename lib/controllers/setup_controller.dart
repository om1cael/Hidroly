import 'package:flutter/material.dart';
import 'package:hidroly/data/model/enum/settings.dart';
import 'package:hidroly/provider/settings_provider.dart';

class SetupController {
  Future<void> saveSettings(
    BuildContext context, 
    SettingsProvider settingsProvider,
    ValueNotifier isMetric,
    ValueNotifier wakeUpTime,
    ValueNotifier sleepTime,
    ValueNotifier frequency,
  ) async {    
    await settingsProvider.updateIsMetric(isMetric.value);
    
    await settingsProvider.updateTime(
      Settings.wakeUpTime,
      wakeUpTime.value.hour, 
      wakeUpTime.value.minute
    );

    await settingsProvider.updateTime(
      Settings.sleepTime,
      sleepTime.value.hour, 
      sleepTime.value.minute
    );

    await settingsProvider.updateFrequency(frequency.value.frequency);
  }
}