import 'package:flutter/widgets.dart';
import 'package:hidroly/database/database_helper.dart';
import 'package:hidroly/model/User.dart';
import 'package:hidroly/model/water_button.dart';

class HomeController {
  User? user;
  List<WaterButton>? customCups = [];
  
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController customCupAmountController = TextEditingController();

  Future<void> loadUser() async {
    user = await DatabaseHelper.instance.getUser(1);
  }
  
  Future<void> updateUser(User updatedUser) async {
    await DatabaseHelper.instance.updateUser(updatedUser);
    await loadUser();
  }

  Future<void> loadCustomCups() async {
    customCups = await DatabaseHelper.instance.getAllCustomCups();
  }

  Future<void> onSubmitCustomCup(context) async {
    if(formKey.currentState!.validate()) {
      int customCupAmount = int.parse(customCupAmountController.text);

      await DatabaseHelper.instance.createCustomCup(
        WaterButton(amount: customCupAmount),
      );

      await loadCustomCups();
      customCupAmountController.clear();
      Navigator.pop(context);
    }
  }
}