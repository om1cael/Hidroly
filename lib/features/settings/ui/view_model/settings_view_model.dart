import 'package:flutter/material.dart';
import 'package:hidroly/core/data/repositories/backup_repository_impl.dart';
import 'package:hidroly/core/domain/enums/unit_systems.dart';
import 'package:hidroly/core/providers/theme_provider.dart';
import 'package:hidroly/core/providers/unit_system_provider.dart';
import 'package:hidroly/features/settings/ui/state/settings_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_view_model.g.dart';

@riverpod
class SettingsViewModel extends _$SettingsViewModel {
  @override
  Future<SettingsState> build() async {
    final themeMode = await ref.watch(themeProviderProvider.future);
    final unitSystem = await ref.watch(unitSystemProviderProvider.future);
    
    return SettingsState(
      theme: themeMode,
      unitSystem: unitSystem,
    );
  }

  void setTheme(ThemeMode theme) {
    ref.read(themeProviderProvider.notifier).setTheme(theme);
  }

  void setUnitSystem(UnitSystem unitSystem) {
    ref.read(unitSystemProviderProvider.notifier).setUnitSystem(unitSystem);
  }

  Future<void> exportData() async {
    await ref.read(backupRepositoryProvider).exportData();
  }
}