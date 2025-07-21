import 'package:shared_preferences/shared_preferences.dart';

class SettingsService {
  final _asyncPrefs = SharedPreferencesAsync();

  Future<void> updateIsMetric(bool value) async {
    await _asyncPrefs.setBool('isMetric', value);
  }

  Future<bool> readIsMetric() async {
    return await _asyncPrefs.getBool('isMetric') ?? true;
  }
}