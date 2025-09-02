import 'package:flutter/material.dart';
import 'package:hidroly/data/repository/custom_cups_repository.dart';
import 'package:hidroly/data/model/water_button.dart';
import 'package:sqflite/sqflite.dart';

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

  Future<bool> updateCustomCup(WaterButton waterButton) async {
    try {
      await _customCupsRepository.updateCustomCup(waterButton);
    } on DatabaseException {
      return false;
    }

    await loadCustomCups();
    return true;
  }

  Future<bool> deleteCustomCup(int id) async {
    try {
      await _customCupsRepository.deleteCustomCup(id);
    } on DatabaseException {
      return false;
    }

    await loadCustomCups();
    return true;
  }

  Future<void> reorderCups(int oldPos, int newPos) async {
    final movedCup = _customCups.removeAt(oldPos);
    _customCups.insert(newPos, movedCup);

    for(WaterButton waterButton in _customCups) {
      final modifiedWaterButton =
        waterButton.copyWith(position: _customCups.indexOf(waterButton));
      
      await _customCupsRepository.updateCustomCup(modifiedWaterButton);
    }
  }
}