import 'package:flutter/material.dart';
import 'package:hidroly/core/domain/enums/unit_systems.dart';

abstract class SettingsRepository {
  Future<void> saveUnitSystem(UnitSystem unitSystem);
  Future<void> saveTheme(ThemeMode theme);
  Future<void> saveWakeUpTime(TimeOfDay wakeUpTime);
  Future<void> saveSleepTime(TimeOfDay sleepTime);
  Future<void> saveNotificationFrequency(int frequency);
  Future<UnitSystem> readUnitSystem();
  Future<ThemeMode> readTheme();
  Future<TimeOfDay> readWakeUpTime();
  Future<TimeOfDay> readSleepTime();
  Future<int> readNotificationFrequency();
}