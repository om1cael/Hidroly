import 'package:hidroly/provider/day_provider.dart';
import 'package:hidroly/provider/settings_provider.dart';

class HomeViewModel {
  final DayProvider _dayProvider;
  final SettingsProvider _settingsProvider;

  const HomeViewModel({
    required DayProvider dayProvider,
    required SettingsProvider settingsProvider,
  }) : _dayProvider = dayProvider,
      _settingsProvider = settingsProvider;

  Future<bool> initializeData() async {
    try {
      bool dayExists = await loadLatestDay();
      if(!dayExists) return false;

      await loadAllSettings();
      return true;
    } on Exception {
      return false;
    }
  }

  Future<bool> loadLatestDay() async =>
    await _dayProvider.loadLatestDay();

  Future<void> loadAllSettings() async => 
    await _settingsProvider.loadAllSettings();
}