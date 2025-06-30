import 'package:hidroly/database/database_helper.dart';
import 'package:hidroly/model/water_button.dart';

class HomeController {
  List<WaterButton>? customCups = [];

  Future<void> loadCustomCups() async {
    customCups = await DatabaseHelper.instance.getAllCustomCups();
  }

  Future<bool> createCustomCup(String amountText) async {
    int? customCupAmount = int.tryParse(amountText);

    if(customCupAmount == null) return false;

    await DatabaseHelper.instance.createCustomCup(
      WaterButton(amount: customCupAmount),
    );

    await loadCustomCups();
    return true;
  }
}