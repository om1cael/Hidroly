import 'package:flutter/widgets.dart';
import 'package:hidroly/data/model/day.dart';
import 'package:hidroly/data/repository/day_repository.dart';
import 'package:hidroly/utils/calculate_dailygoal.dart';

class DayProvider extends ChangeNotifier {
  DayRepository? _repository;

  Day? _day;
  Day? get user => _day;


  void setRepository(DayRepository repository) {
    _repository = repository;
  }

  Future<bool> create(String ageText, String weightText) async {
    int? age = int.tryParse(ageText);
    int? weight = int.tryParse(weightText);

    if(age == null || weight == null) return false;

    int dailyGoal = CalculateDailyGoal().calculate(age, weight);
    await _repository!.create(
      Day(
        id: 1, 
        dailyGoal: dailyGoal, 
        currentAmount: 0
      )
    );
    return true;
  }

  Future<void> read(int id) async {
    _day = await _repository!.read(id);
    notifyListeners();
  }
  
  Future<void> update(Day updatedUser) async {
    await _repository!.update(updatedUser);
    await read(updatedUser.id);
  }

  Future<void> addWater(int amount) async {
    Day updatedDay = _day!.copyWith(
      currentAmount: _day!.currentAmount + amount,
    );

    await update(updatedDay);
  }
}