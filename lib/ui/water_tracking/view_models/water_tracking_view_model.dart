import 'package:hidroly/domain/models/day.dart';
import 'package:hidroly/provider/custom_cups_provider.dart';
import 'package:hidroly/provider/daily_history_provider.dart';
import 'package:hidroly/provider/day_provider.dart';

class WaterTrackingViewModel {
  final DayProvider _dayProvider;
  final CustomCupsProvider _customCupsProvider;
  final DailyHistoryProvider _dailyHistoryProvider;

  const WaterTrackingViewModel({
    required DayProvider dayProvider,
    required CustomCupsProvider customCupsProvider,
    required DailyHistoryProvider dailyHistoryProvider,
  }) : _dayProvider = dayProvider, 
      _customCupsProvider = customCupsProvider,
      _dailyHistoryProvider = dailyHistoryProvider;

  Future<bool> loadTrackingData() async {
    try {
      await Future.wait([
        createAndLoadIfNewDay(),
        loadCustomCups(),
        loadDailyHistory(),
      ]);

      return true;
    } on Exception {
      return false;
    }
  }

  Future<void> loadDailyHistory({Day? currentDay}) async {
    currentDay ??= _dayProvider.day;
    if(currentDay == null) return;
    
    final dayId = currentDay.id!;
    await _dailyHistoryProvider.getAll(dayId);
  }

  Future<bool> loadLatestDay() async =>
    await _dayProvider.loadLatestDay();

  Future<void> createAndLoadIfNewDay() async =>
    await _dayProvider.createAndLoadIfNewDay();

  Future<void> loadCustomCups() async =>
    await _customCupsProvider.loadCustomCups();
}