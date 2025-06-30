import 'package:hidroly/database/database_helper.dart';
import 'package:hidroly/model/user.dart';
import 'package:hidroly/utils/calculate_dailygoal.dart';

class SetupController {
  Future<bool> save(String ageText, String weightText) async {
    int? age = int.tryParse(ageText);
    int? weight = int.tryParse(weightText);

    if(age == null || weight == null) return false;

    int dailyGoal = CalculateDailyGoal().calculate(age, weight);
    await DatabaseHelper.instance.createUser(User(id: 1, dailyGoal: dailyGoal, currentAmount: 0));
    return true;
  }
}