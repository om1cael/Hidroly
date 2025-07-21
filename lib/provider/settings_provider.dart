import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  final _asyncPrefs = SharedPreferencesAsync();

  bool? isMetric;

  Future<void> updateIsMetric(bool value) async {
    await _asyncPrefs.setBool('isMetric', value);
    isMetric = value;
    notifyListeners();
  }

  Future<void> readIsMetric() async {
    isMetric = await _asyncPrefs.getBool('isMetric') ?? true;
    notifyListeners();
  }
}