import 'package:flutter/material.dart';
import 'package:hidroly/core/domain/enums/unit_systems.dart';

abstract class NotificationService {
  Future<void> initialize();
  Future<void> showNotification(String title, String body, UnitSystem unitSystem);
  void setUpScheduler(String title, String body, int frequency);
  void askForPermission();
  bool isNotificationAllowed(TimeOfDay now, TimeOfDay wakeUpTime, TimeOfDay sleepTime);
}