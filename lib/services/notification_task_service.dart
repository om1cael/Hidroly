import 'package:flutter/material.dart';
import 'package:hidroly/data/model/enum/settings.dart';
import 'package:hidroly/services/notification_service.dart';
import 'package:hidroly/utils/app_date_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationTaskService {
  static Future<void> executeNotificationTask(Map<String, dynamic> inputData) async {
    final now = DateTime.now();

    final nowTime     = TimeOfDay.fromDateTime(now);
    final wakeUpTime  = AppDateUtils.parseTime(inputData[Settings.wakeUpTime.value]);
    final sleepTime   = AppDateUtils.parseTime(inputData[Settings.sleepTime.value]);
    
    if(!AppDateUtils.isWithinTimeRange(nowTime, wakeUpTime, sleepTime)) return;

    final sharedPreferences = SharedPreferencesAsync();
    final String title  = inputData['title'];
    final String body   = inputData['body'];

    final lastNotificationMillis    = await sharedPreferences.getInt('lastNotificationTime') ?? 0;
    final lastNotificationDateTime  = DateTime.fromMillisecondsSinceEpoch(lastNotificationMillis);
    final isNotificationAllowed     = now.difference(lastNotificationDateTime).inHours >= 2;

    if(isNotificationAllowed) {
      final notificationService = NotificationService();
      await notificationService.initialize();
      await notificationService.showNotification(
        title,
        body,
      );

      await sharedPreferences.setInt(
        'lastNotificationTime', 
        DateTime.now().millisecondsSinceEpoch
      );
    }
  }
}