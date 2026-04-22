import 'package:flutter/material.dart';
import 'package:hidroly/core/domain/enums/unit_systems.dart';

abstract class NotificationService {
  Future<void> initialize();
  Future<void> showNotification(UnitSystem unitSystem);
  void setUpScheduler(int frequency);
  void askForPermission();
  bool isNotificationAllowed(TimeOfDay now, TimeOfDay wakeUpTime, TimeOfDay sleepTime);
}