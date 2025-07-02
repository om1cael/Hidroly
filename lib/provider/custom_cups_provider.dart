import 'package:flutter/material.dart';
import 'package:hidroly/data/repository/custom_cups_repository.dart';
import 'package:hidroly/data/model/water_button.dart';

class CustomCupsProvider extends ChangeNotifier {
  final CustomCupsRepository _customCupsRepository;

  List<WaterButton> _customCups = [];
  List<WaterButton> get customCups => _customCups;

  CustomCupsProvider(this._customCupsRepository);

  Future<void> loadCustomCups() async {
    _customCups = await _customCupsRepository.loadCustomCups();
    notifyListeners();
  }

  Future<bool> createCustomCup(String amountText) async {
    int? customCupAmount = int.tryParse(amountText);
    if(customCupAmount == null) return false;

    await _customCupsRepository.createCustomCup(
      WaterButton(amount: customCupAmount),
    );

    await loadCustomCups();
    return true;
  }
}