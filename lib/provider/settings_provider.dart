import 'package:flutter/material.dart';
import 'package:hidroly/domain/models/enum/frequency.dart';
import 'package:hidroly/domain/models/enum/settings.dart';
import 'package:hidroly/utils/app_date_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  final _asyncPrefs = SharedPreferencesAsync();

  final _isMetricKey = 'isMetric';
  final _themeKey = 'theme';
  final _frequencyKey = 'frequency';
  final _hapticFeedbackKey = 'hapticFeedback';

  bool isMetric;
  bool hapticFeedback;
  Frequency frequencyHolder;
  ThemeMode theme;
  TimeOfDay wakeUpTime;
  TimeOfDay sleepTime;

  SettingsProvider({
    this.isMetric = true,
    this.hapticFeedback = true,
    this.frequencyHolder = Frequency.every2Hours,
    this.theme = ThemeMode.system,
    this.wakeUpTime = const TimeOfDay(hour: 6, minute: 0),
    this.sleepTime = const TimeOfDay(hour: 22, minute: 0),
  });

  Future<void> loadAllSettings() async {
    await readIsMetric();
    await readTime(Settings.wakeUpTime);
    await readTime(Settings.sleepTime);
  }

  Future<void> updateIsMetric(bool value) async {
    await _asyncPrefs.setBool(_isMetricKey, value);
    isMetric = value;
    notifyListeners();
  }

  Future<void> readIsMetric() async {
    isMetric = await _asyncPrefs.getBool(_isMetricKey) ?? true;
    notifyListeners();
  }

  Future<void> updateHapticFeedback(bool value) async {
    await _asyncPrefs.setBool(_hapticFeedbackKey, value);
    hapticFeedback = value;
    notifyListeners();
  }

  Future<void> readHapticFeedback() async {
    hapticFeedback = await _asyncPrefs.getBool(_hapticFeedbackKey) ?? true;
    notifyListeners();
  }

  Future<void> updateTheme(ThemeMode newTheme) async {
    await _asyncPrefs.setInt(_themeKey, newTheme.index);
    theme = newTheme;
    notifyListeners();
  }

  Future<ThemeMode> readTheme() async {
    final themeIndex = await _asyncPrefs.getInt(_themeKey) ?? ThemeMode.system.index;
    
    theme = ThemeMode.values[themeIndex];
    notifyListeners();
    return theme;
  }

  Future<void> updateFrequency(int value) async {
    await _asyncPrefs.setInt(_frequencyKey, value);
    frequencyHolder = Frequency.getFrequency(value);
    notifyListeners();
  }

  Future<void> readFrequency() async {
    int frequencyTime = await _asyncPrefs.getInt(_frequencyKey) ?? Frequency.every2Hours.frequency;
    frequencyHolder = Frequency.getFrequency(frequencyTime);
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