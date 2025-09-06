import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hidroly/domain/models/enum/settings.dart';
import 'package:hidroly/domain/models/water_button.dart';
import 'package:hidroly/provider/custom_cups_provider.dart';
import 'package:hidroly/provider/day_provider.dart';
import 'package:hidroly/provider/settings_provider.dart';
import 'package:sqflite/sqflite.dart';

class SetupController {
  final DayProvider dayProvider;
  final CustomCupsProvider customCupsProvider;
  final SettingsProvider settingsProvider;

  const SetupController({
    required this.dayProvider,
    required this.customCupsProvider,
    required this.settingsProvider
  });

  Future<bool> createDay(BuildContext context, int dailyGoal) async {
    final localDate = DateTime.now();
    
    return await dayProvider.create(
      localDate,
      dailyGoal,
    );
  }

  Future<bool> createDefaultCups() async {
    final defaultCups = [
      WaterButton(amount: 250, position: 0),
      WaterButton(amount: 300, position: 1),
      WaterButton(amount: 600, position: 2),
    ];

    try {
      for(WaterButton cup in defaultCups) {
        await customCupsProvider
          .createCustomCup(cup.amount);
      }
    } on DatabaseException {
      return false;
    }

    return true;
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

  void requestAndroidNotificationPermission() {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()!.requestNotificationsPermission();
  }
}