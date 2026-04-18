import 'package:flutter/material.dart';
import 'package:hidroly/core/providers/theme_provider.dart';
import 'package:hidroly/features/settings/ui/state/settings_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_view_model.g.dart';

@riverpod
class SettingsViewModel extends _$SettingsViewModel {
  @override
  Future<SettingsState> build() async {
    final themeMode = await ref.watch(themeProviderProvider.future);
    
    return SettingsState(
      theme: themeMode,
    );
  }

  void setTheme(ThemeMode theme) {
    ref.read(themeProviderProvider.notifier).setTheme(theme);
  }
}