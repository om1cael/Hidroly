import 'package:flutter/material.dart';
import 'package:hidroly/data/model/enum/settings.dart';
import 'package:hidroly/provider/day_provider.dart';
import 'package:hidroly/provider/settings_provider.dart';

class SetupController {
  final DayProvider dayProvider;
  final SettingsProvider settingsProvider;

  SetupController({
    required this.dayProvider,
    required this.settingsProvider
  });

  Future<bool> createDay(BuildContext context, int dailyGoal) async {
    final localDate = DateTime.now();
    
    return await dayProvider.create(
      localDate,
      dailyGoal,
    );
  }

  Future<void> saveSettings(
    BuildContext context, 
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