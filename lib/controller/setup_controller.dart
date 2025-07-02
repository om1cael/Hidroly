import 'package:hidroly/data/datasource/user_local_datasource_impl.dart';
import 'package:hidroly/model/user.dart';
import 'package:hidroly/utils/calculate_dailygoal.dart';

class SetupController {
  final UserLocalDataSourceImpl _userLocalDataSourceImpl;

  SetupController(this._userLocalDataSourceImpl);

  Future<bool> save(String ageText, String weightText) async {
    int? age = int.tryParse(ageText);
    int? weight = int.tryParse(weightText);

    if(age == null || weight == null) return false;

    int dailyGoal = CalculateDailyGoal().calculate(age, weight);
    await _userLocalDataSourceImpl.createUser(User(id: 1, dailyGoal: dailyGoal, currentAmount: 0));
    return true;
  }
}