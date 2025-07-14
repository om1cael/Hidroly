import 'package:flutter/widgets.dart';
import 'package:hidroly/data/model/day.dart';
import 'package:hidroly/data/repository/day_repository.dart';
import 'package:path/path.dart';

class DayProvider extends ChangeNotifier {
  late DayRepository _repository;

  Day? _day;
  Day? get day => _day;

  void setRepository(DayRepository repository) {
    _repository = repository;
  }

  Future<bool> create(DateTime date, int dailyGoal) async {
    await _repository.create(
      Day(
        dailyGoal: dailyGoal,
        date: date,
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
    if(_day == null) return;

    final appDate = DateTime.utc(
      _day!.date.year,
      _day!.date.month,
      _day!.date.day,
    );

    final now = DateTime.now().toUtc();
    final currentDate = DateTime.utc(
      now.year, 
      now.month, 
      now.day
    );

    if (appDate != currentDate) {
      await create(currentDate, _day!.dailyGoal);
      await findLatest();
    }
  }

  Future<void> findLatest() async {
    Day? latestDay = await _repository.findLatest();

    if(latestDay != null) {
      _day = latestDay;
    }

    notifyListeners();
  }
  
  Future<void> update(Day updatedDay) async {
    await _repository.update(updatedDay);
    await findLatest();
  }

  Future<void> addWater(int amount) async {
    Day updatedDay = _day!.copyWith(
      currentAmount: _day!.currentAmount + amount,
    );

    await update(updatedDay);
  }

  Future<bool> removeWater(int amount) async {
    if(_day!.currentAmount < amount || amount <= 0) return false;

    Day updatedDay = _day!.copyWith(
      currentAmount: _day!.currentAmount - amount,
    );

    await update(updatedDay);
    return true;
  }
}