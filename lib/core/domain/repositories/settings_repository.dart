import 'package:flutter/material.dart';
import 'package:hidroly/core/domain/enums/unit_systems.dart';

abstract class SettingsRepository {
  Future<void> saveUnitSystem(UnitSystem unitSystem);
  Future<void> saveTheme(ThemeMode theme);
  Future<UnitSystem> readUnitSystem();
  Future<ThemeMode> readTheme();
}