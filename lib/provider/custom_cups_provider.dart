import 'package:flutter/material.dart';
import 'package:hidroly/data/repository/custom_cups_repository.dart';
import 'package:hidroly/data/model/water_button.dart';

class CustomCupsProvider extends ChangeNotifier {
  late CustomCupsRepository _customCupsRepository;

  List<WaterButton> _customCups = [];
  List<WaterButton> get customCups => _customCups;

  void setRepository(CustomCupsRepository repository) {
    _customCupsRepository = repository;
  }

  Future<void> loadCustomCups() async {
    _customCups = await _customCupsRepository.loadCustomCups();
    notifyListeners();
  }

  Future<bool> createCustomCup(int customCupAmount) async {
    if(customCupAmount <= 0) return false;

    await _customCupsRepository.createCustomCup(
      WaterButton(amount: customCupAmount),
    );

    await loadCustomCups();
    return true;
  }
}