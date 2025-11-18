import 'package:hidroly/provider/day_provider.dart';
import 'package:hidroly/utils/calculate_dailygoal.dart';
import 'package:hidroly/utils/unit_tools.dart';

class SettingsUpdateDailyGoalPageViewModel {
  final DayProvider _dayProvider;

  const SettingsUpdateDailyGoalPageViewModel({
    required DayProvider dayProvider,
  }) : _dayProvider = dayProvider;

  bool updateDailyGoal(String ageText, String weightText, bool isMetric) {
    final currentDay = _dayProvider.day;
    if(currentDay == null) return false;

    final newDailyGoal = 
      calculateNewDailyGoal(ageText, weightText, isMetric);
    
    _dayProvider.update(
      currentDay.copyWith(
        dailyGoal: newDailyGoal,
      ),
    );

    return true;
  }

  int calculateNewDailyGoal(String ageText, String weightText, bool isMetric) {
    final age = int.parse(ageText);
    int weight = int.parse(weightText);

    if(!isMetric) {
      weight = UnitTools.lbToKg(weight);
    }

    return CalculateDailyGoal().calculate(age, weight);
  }
}