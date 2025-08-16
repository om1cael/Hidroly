import 'package:flutter/material.dart';
import 'package:hidroly/data/model/enum/settings.dart';
import 'package:hidroly/services/notification_service.dart';
import 'package:hidroly/utils/app_date_utils.dart';

class NotificationTaskService {
  static Future<void> executeNotificationTask(Map<String, dynamic> inputData) async {
    final nowTime     = TimeOfDay.now();
    final wakeUpTime  = AppDateUtils.parseTime(inputData[Settings.wakeUpTime.value]);
    final sleepTime   = AppDateUtils.parseTime(inputData[Settings.sleepTime.value]);
    
    if(!AppDateUtils.isWithinTimeRange(nowTime, wakeUpTime, sleepTime)) return;

    final String title  = inputData['title'];
    final String body   = inputData['body'];

    final notificationService = NotificationService();
    await notificationService.initialize();
    await notificationService.showNotification(
      title,
      body,
    );
  }
}