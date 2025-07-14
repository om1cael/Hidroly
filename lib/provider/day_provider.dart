import 'package:flutter/widgets.dart';
import 'package:hidroly/data/model/day.dart';
import 'package:hidroly/data/repository/day_repository.dart';
import 'package:hidroly/utils/calculate_dailygoal.dart';

class DayProvider extends ChangeNotifier {
  DayRepository? _repository;

  Day? _day;
  Day? get day => _day;

  void setRepository(DayRepository repository) {
    _repository = repository;
  }

  Future<bool> create(int? age, int? weight) async {
    if(age == null || weight == null) return false;

    int dailyGoal = CalculateDailyGoal().calculate(age, weight);
    await _repository!.create(
      Day(
        dailyGoal: dailyGoal,
        date: DateTime.now().toUtc(),
      )
    );
    return true;
  }

  Future<void> read(int id) async {
    _day = await _repository!.read(id);
    notifyListeners();
  }
  
  Future<void> update(Day updatedDay) async {
    await _repository!.update(updatedDay);
    await read(updatedDay.id!);
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