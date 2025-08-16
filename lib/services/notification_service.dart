import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hidroly/data/model/enum/settings.dart';
import 'package:hidroly/l10n/app_localizations.dart';
import 'package:hidroly/provider/settings_provider.dart';
import 'package:hidroly/utils/app_date_utils.dart';
import 'package:workmanager/workmanager.dart';

class NotificationService {
  final flutterLocalNotificationsPlugin 
    = FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    const androidSettings = AndroidInitializationSettings(
      "@mipmap/ic_launcher"
    );

    final InitializationSettings initializationSettings = 
      InitializationSettings(
        android: androidSettings,
      );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
  }
  
  Future<void> showNotification(
    String notificationTitle,
    String notificationBody,
  ) async {
    final androidNotificationDetails = AndroidNotificationDetails(
      'water-reminder', 
      'Remind me to drink water',
      channelDescription: 'Get reminders to drink water throughout the day',
      importance: Importance.max,
      priority: Priority.high,
    );

    final notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );

    await flutterLocalNotificationsPlugin.show(
      0, 
      notificationTitle, 
      notificationBody, 
      notificationDetails
    );
  }

  Future<bool> registerPeriodicNotificationTask(
    BuildContext context, 
    SettingsProvider settingsProvider,
    {int minutes = 120}
  ) async {
    if(settingsProvider.wakeUpTime == null || settingsProvider.sleepTime == null) {
      return false;
    }

    final workManager = Workmanager();

    final formattedWakeUpTime = AppDateUtils.formatTime(
      settingsProvider.wakeUpTime!.hour, 
      settingsProvider.wakeUpTime!.minute
    );

    final formattedSleepTime = AppDateUtils.formatTime(
      settingsProvider.sleepTime!.hour, 
      settingsProvider.sleepTime!.minute
    );
    
    await workManager.cancelAll();
    
    if(!context.mounted) return false;
    await workManager.registerPeriodicTask(
      'notification',
      'notificationTask',
      frequency: Duration(minutes: minutes),
      inputData: {
        Settings.wakeUpTime.value: formattedWakeUpTime,
        Settings.sleepTime.value: formattedSleepTime,
        'title': AppLocalizations.of(context)!.reminderNotificationTitle,
        'body': AppLocalizations.of(context)!.reminderNotificationBody,
      }
    );

    return true;
  }
}