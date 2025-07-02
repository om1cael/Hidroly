import 'package:flutter/material.dart';
import 'package:hidroly/data/database/database_helper.dart';
import 'package:hidroly/model/water_button.dart';

class CustomCupsProvider extends ChangeNotifier {
  List<WaterButton> _customCups = [];
  List<WaterButton> get customCups => _customCups;

  Future<void> loadCustomCups() async {
    _customCups = await DatabaseHelper.instance.getAllCustomCups();
    notifyListeners();
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