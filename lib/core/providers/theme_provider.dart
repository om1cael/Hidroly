import 'package:flutter/material.dart';
import 'package:hidroly/core/data/repositories/settings_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

@riverpod
class ThemeProvider extends _$ThemeProvider {
  @override
  Future<ThemeMode> build() {
    return ref.watch(settingsRepositoryProvider).readTheme();
  }

  void setTheme(ThemeMode theme) {
    ref.read(settingsRepositoryProvider).saveTheme(theme);
    state = AsyncValue.data(theme);
  }
}