import 'package:flutter/widgets.dart';
import 'package:hidroly/data/model/day.dart';
import 'package:hidroly/data/repository/day_repository.dart';
import 'package:hidroly/utils/calculate_dailygoal.dart';

class DayProvider extends ChangeNotifier {
  DayRepository? _userRepository;

  Day? _user;
  Day? get user => _user;


  void setRepository(DayRepository repository) {
    _userRepository = repository;
  }

  Future<bool> createUser(String ageText, String weightText) async {
    int? age = int.tryParse(ageText);
    int? weight = int.tryParse(weightText);

    if(age == null || weight == null) return false;

    int dailyGoal = CalculateDailyGoal().calculate(age, weight);
    await _userRepository!.createUser(
      Day(
        id: 1, 
        dailyGoal: dailyGoal, 
        currentAmount: 0
      )
    );
    return true;
  }

  Future<void> loadUser(int id) async {
    _user = await _userRepository!.loadUser(id);
    notifyListeners();
  }
  
  Future<void> updateUser(Day updatedUser) async {
    await _userRepository!.updateUser(updatedUser);
    await loadUser(updatedUser.id);
  }

  Future<void> addWater(int amount) async {
    Day updatedUser = _user!.copyWith(
      currentAmount: _user!.currentAmount + amount,
    );

    await updateUser(updatedUser);
  }
}