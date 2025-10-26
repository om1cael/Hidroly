import 'package:hidroly/provider/day_provider.dart';

class HomeViewModel {
  final DayProvider _provider;

  const HomeViewModel({
    required DayProvider dayProvider,
  }) : _provider = dayProvider;

  Future<bool> initializeDayData() async {
    try {
      return await loadLatestDay();
    } on Exception {
      return false;
    }
  }

  Future<bool> loadLatestDay() async =>
    await _provider.loadLatestDay();
}