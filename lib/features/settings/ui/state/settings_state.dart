import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hidroly/core/domain/enums/unit_systems.dart';

part 'settings_state.freezed.dart';

@freezed
abstract class SettingsState with _$SettingsState {
  const factory SettingsState({
    @Default(ThemeMode.system) ThemeMode theme,
    @Default(UnitSystem.metric) UnitSystem unitSystem,
  }) = _SettingsState; 
}