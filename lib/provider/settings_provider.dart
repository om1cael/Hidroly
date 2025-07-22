import 'package:flutter/material.dart';
import 'package:hidroly/data/model/enum/settings.dart';
import 'package:hidroly/utils/app_date_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  final _asyncPrefs = SharedPreferencesAsync();

  bool? isMetric;
  TimeOfDay? wakeUpTime;
  TimeOfDay? sleepTime;

  Future<void> updateIsMetric(bool value) async {
    await _asyncPrefs.setBool('isMetric', value);
    isMetric = value;
    notifyListeners();
  }

  Future<void> readIsMetric() async {
    isMetric = await _asyncPrefs.getBool('isMetric') ?? true;
    notifyListeners();
  }

  Future<void> updateTime(Settings key, int hour, int minutes) async {
    await _saveTime(key.value, hour, minutes);
    final time = AppDateUtils.parseTime(AppDateUtils.formatTime(hour, minutes));

    _assignTime(key, time);
    notifyListeners();
  }

  Future<void> readTime(Settings key) async {
    final time = await _asyncPrefs.getString(key.value);
    if (time == null) return;

    final parsedTime = AppDateUtils.parseTime(time);
    _assignTime(key, parsedTime);
    notifyListeners();
  }

  Future<void> _saveTime(String key, int hour, int minutes) async {
    final formattedTime = AppDateUtils.formatTime(hour, minutes);
    await _asyncPrefs.setString(key, formattedTime);
  }

  void _assignTime(Settings key, TimeOfDay time) {
    switch(key) {
      case Settings.wakeUpTime:
        wakeUpTime = time;
        break;
      case Settings.sleepTime:
        sleepTime = time;
        break;
      default:
        throw ArgumentError('Tried to assign time to an unsuported settings key: $key.');
    }
  }
}