import 'package:flutter/material.dart';
import 'package:hidroly/data/model/enum/settings.dart';
import 'package:hidroly/services/notification_service.dart';
import 'package:hidroly/utils/app_date_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workmanager/workmanager.dart';

class WorkManagerService {
  Future<void> initialize() async {
    await Workmanager().initialize(
      callbackDispatcher,
      isInDebugMode: false
    );
  }

  Future<void> executeNotificationTask(
    Map<String, dynamic> inputData
  ) async {
    TimeOfDay wakeUpTime = AppDateUtils.parseTime(inputData[Settings.wakeUpTime.value]);
    TimeOfDay sleepTime = AppDateUtils.parseTime(inputData[Settings.sleepTime.value]);
    TimeOfDay now = TimeOfDay.now();

    String title = inputData['title'];
    String body = inputData['body'];

    bool isOnTimeRange = AppDateUtils.isWithinTimeRange(now, wakeUpTime, sleepTime);

    if(isOnTimeRange) {
      final notificationService = NotificationService();
      await notificationService.initialize();
      await notificationService.showNotification(
        title,
        body,
      );
    }
  }

  @pragma('vm:entry-point')
  void callbackDispatcher() {
    Workmanager().executeTask((task, inputData) async {
      if(task == 'notificationTask') {
        if(inputData == null) {
          return Future.value(false);
        }

        executeNotificationTask(inputData);
      }
      return Future.value(true);
    });
  }
}