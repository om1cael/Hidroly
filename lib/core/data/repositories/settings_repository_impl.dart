import 'package:flutter/material.dart';
import 'package:hidroly/core/domain/enums/unit_systems.dart';
import 'package:hidroly/core/domain/repositories/settings_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_repository_impl.g.dart';

@riverpod
SettingsRepository settingsRepository(Ref ref) {
  return SettingsRepositoryImpl();
}

class SettingsRepositoryImpl implements SettingsRepository {
  final sharedPreferences = SharedPreferencesAsync();

  final unitSystemKey = 'unitSystem';
  final themeKey = 'theme';
  final wakeUpTimeKey = 'wakeUpTime';
  final sleepTimeKey = 'sleepTime';
  final notificationFrequencyKey = 'frequency';

  @override
  Future<void> saveUnitSystem(UnitSystem unitSystem) async {
    await sharedPreferences.setInt(unitSystemKey, unitSystem.index);
  }

  @override
  Future<void> saveTheme(ThemeMode theme) async {
    await sharedPreferences.setInt(themeKey, theme.index);
  }

  @override
  Future<void> saveWakeUpTime(TimeOfDay wakeUpTime) async {
    final dateString = DateTime(2026, 1, 1, wakeUpTime.hour, wakeUpTime.minute).toIso8601String();
    await sharedPreferences.setString(wakeUpTimeKey, dateString);
  }
  
  @override
  Future<void> saveSleepTime(TimeOfDay sleepTime) async {
    final dateString = DateTime(2026, 1, 1, sleepTime.hour, sleepTime.minute).toIso8601String();
    await sharedPreferences.setString(sleepTimeKey, dateString);
  }
  
  @override
  Future<void> saveNotificationFrequency(int frequency) async {
    await sharedPreferences.setInt(notificationFrequencyKey, frequency);
  }

  @override
  Future<UnitSystem> readUnitSystem() async {
    final index = await sharedPreferences.getInt(unitSystemKey) ?? 0;
    return UnitSystem.values[index];
  }

  @override
  Future<ThemeMode> readTheme() async {
    final index = await sharedPreferences.getInt(themeKey) ?? 0;
    return ThemeMode.values[index];
  }
  
  @override
  Future<TimeOfDay> readWakeUpTime() async {
    try {
      final savedDate = await sharedPreferences.getString(wakeUpTimeKey);
      final parsedDate = DateTime.tryParse(savedDate!);

      return TimeOfDay.fromDateTime(parsedDate!);
    } catch (_) {
      return TimeOfDay(hour: 8, minute: 0);
    }
  }

  
  @override
  Future<TimeOfDay> readSleepTime() async {
    try {
      final savedDate = await sharedPreferences.getString(sleepTimeKey);
      final parsedDate = DateTime.tryParse(savedDate!);

      return TimeOfDay.fromDateTime(parsedDate!);
    } catch (_) {
      return TimeOfDay(hour: 21, minute: 0);
    }
  }
  
  @override
  Future<int> readNotificationFrequency() async {
    return await sharedPreferences.getInt(notificationFrequencyKey) ?? 2;
  }
}