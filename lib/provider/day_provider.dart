import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart' hide Day;
import 'package:hidroly/data/repository/summary_repository.dart';
import 'package:hidroly/domain/models/day.dart';
import 'package:hidroly/data/repository/day_repository.dart';
import 'package:hidroly/domain/models/global_statistic.dart';
import 'package:hidroly/utils/app_date_utils.dart';

class DayProvider extends ChangeNotifier {
  DayProvider({
    required SummaryRepository summaryRepository,
  }) : _summaryRepository = summaryRepository;

  final SummaryRepository _summaryRepository;
  late DayRepository _repository;

  Day? _day;
  Day? get day => _day;
  set day(Day? value) {
    _day = value;
    notifyListeners();
  }

  void setRepository(DayRepository repository) {
    _repository = repository;
  }

  Future<bool> create(DateTime localDate, int dailyGoal) async {
    await _repository.create(
      Day(
        dailyGoal: dailyGoal,
        date: localDate.toUtc(),
      )
    );
    return true;
  }

  /// Creates a new day if the current date differs from the last loaded date.
  /// If all goes well, it will load the new day using [findLatest].
  ///
  /// Does nothing if no day is currently loaded.
  /// Make sure to call [findLatest] before using this method.
  ///
  /// Internally calls [create] using the last day's daily goal.
  Future<void> createAndLoadIfNewDay() async {
    final currentDay = _day;
    if(currentDay == null) return;

    final localDate = DateTime.now();

    final currentAppDate = AppDateUtils.normalizedLocal(currentDay.date.toLocal());
    final currentDate = AppDateUtils.normalizedLocal(localDate);

    if (currentAppDate != currentDate) {
      await create(localDate, currentDay.dailyGoal);

      final newDay = await findLatest();
      if(newDay != null) {
        day = newDay;
      }
    }
  }

  Future<bool> loadLatestDay() async {
    Day? latestDay = await findLatest();
    if(latestDay == null) {
      return false;
    }

    day = latestDay;
    notifyListeners();
    return true;
  }

  Future<Day?> findByDateRange(DateTime date) async {
    final start = date.toUtc();
    final end = start.add(Duration(days: 1));

    return await _repository.findByDateRange(start, end);
  }

  Future<Day?> findFirst() async {
    return await _repository.findFirst();
  }

  Future<Day?> findLatest() async {
    return await _repository.findLatest();
  }
  
  Future<void> update(Day updatedDay) async {
    await _repository.update(updatedDay);
    day = updatedDay;
  }

  Future<bool> addWater(int amount) async {
    final currentDay = _day;
    if(currentDay == null) {
      return false;
    }

    final updatedDay = currentDay.copyWith(
      currentAmount: currentDay.currentAmount + amount,
    );

    await update(updatedDay);
    await FlutterLocalNotificationsPlugin().cancelAll();
    await updateGlobalStatistics(amount);
    return true;
  }

  Future<bool> removeWater(int amount) async {
    final currentDay = _day;
    if(currentDay == null || currentDay.currentAmount < amount || amount <= 0) {
      return false;
    }

    final updatedDay = currentDay.copyWith(
      currentAmount: currentDay.currentAmount - amount,
    );

    await update(updatedDay);
    await updateGlobalStatistics(-amount);
    return true;
  }

  Future<void> updateGlobalStatistics(int amount) async {
    GlobalStatistic globalStatistic = await _summaryRepository.readGlobalStatistic();
    final daysCount = await _repository.getDaysCount();

    final newGlobalStatistic = globalStatistic.copyWith(
      totalIntake: globalStatistic.totalIntake + amount,
      averageIntake: globalStatistic.totalIntake ~/ daysCount,
    );

    await _summaryRepository.saveGlobalStatistic(newGlobalStatistic);
  }
}