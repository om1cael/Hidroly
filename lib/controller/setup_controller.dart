import 'package:flutter/widgets.dart';
import 'package:hidroly/database/database_helper.dart';
import 'package:hidroly/model/User.dart';
import 'package:hidroly/utils/calculate_dailygoal.dart';

class SetupController {
  final TextEditingController ageController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void onSubmit() async {
    if(formKey.currentState!.validate()) {
      int age = int.parse(ageController.text);
      int weight = int.parse(weightController.text);

      int dailyGoal = CalculateDailyGoal().calculate(age, weight);
      await DatabaseHelper.instance.createUser(User(id: 1, dailyGoal: dailyGoal, currentAmount: 0));
    }
  }

  void dispose() {
    ageController.dispose();
    weightController.dispose();
  }
}