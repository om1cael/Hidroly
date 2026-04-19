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

  @override
  Future<void> saveUnitSystem(UnitSystem unitSystem) async {
    await sharedPreferences.setInt(unitSystemKey, unitSystem.index);
  }

  @override
  Future<void> saveTheme(ThemeMode theme) async {
    await sharedPreferences.setInt(themeKey, theme.index);
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
}