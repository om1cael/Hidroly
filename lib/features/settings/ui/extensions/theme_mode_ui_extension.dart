import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

extension ThemeModeX on ThemeMode {
  String label() {
    switch(this) {
      case .light: return 'light'.tr();
      case .dark: return 'dark'.tr();
      default: return 'system'.tr();
    }
  }
}