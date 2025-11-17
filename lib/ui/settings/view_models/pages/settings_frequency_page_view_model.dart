import 'package:hidroly/domain/models/enum/frequency.dart';
import 'package:hidroly/provider/settings_provider.dart';

class SettingsFrequencyPageViewModel {
  final SettingsProvider _settingsProvider;

  const SettingsFrequencyPageViewModel({
    required SettingsProvider settingsProvider,
  }) : _settingsProvider = settingsProvider;

  Future<Frequency> loadFrequency() async {
    int frequencyValue = await _getFrequency();
    return Frequency.getFrequency(frequencyValue);
  }

  Future<int> _getFrequency() async {
    await _settingsProvider.readFrequency();
    return _settingsProvider.frequencyHolder.frequency;
  }
}