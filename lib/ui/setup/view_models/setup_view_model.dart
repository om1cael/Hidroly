import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hidroly/data/services/notifications/notification_service.dart';
import 'package:hidroly/domain/models/enum/frequency.dart';
import 'package:hidroly/domain/models/enum/settings.dart';
import 'package:hidroly/domain/models/water_button.dart';
import 'package:hidroly/provider/custom_cups_provider.dart';
import 'package:hidroly/provider/day_provider.dart';
import 'package:hidroly/provider/settings_provider.dart';
import 'package:hidroly/utils/calculate_dailygoal.dart';
import 'package:hidroly/utils/unit_tools.dart';
import 'package:sqflite/sqflite.dart';

class SetupViewModel {
  final DayProvider dayProvider;
  final CustomCupsProvider customCupsProvider;
  final SettingsProvider settingsProvider;

  final isMetric = ValueNotifier(true);
  final frequency = ValueNotifier(Frequency.every2Hours);

  final wakeUpTime = ValueNotifier(TimeOfDay(hour: 6, minute: 0));
  final sleepTime = ValueNotifier(TimeOfDay(hour: 22, minute: 0));

  SetupViewModel({
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

  Future<void> saveSettings(BuildContext context) async {    
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

  Future<bool> registerPeriodicNotificationTask(BuildContext context) async {
    return await NotificationService().registerPeriodicNotificationTask(
      context,
      wakeUpTime.value,
      sleepTime.value,
      frequencyInMinutes: frequency.value.frequency,
    );
  }

  int? getDailyGoal(
    TextEditingController ageController, 
    TextEditingController weightController,
  ) {
    int? age = int.tryParse(ageController.text);
    int? weight = int.tryParse(weightController.text);

    if(age == null || weight == null) return null;

    if(isMetric.value == false) {
      weight = UnitTools.lbToKg(weight);
    }
    
    return CalculateDailyGoal().calculate(age, weight);
  }

  void dispose() {
    isMetric.dispose();
    frequency.dispose();
    wakeUpTime.dispose();
    sleepTime.dispose();
  }
}