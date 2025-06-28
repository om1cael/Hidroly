import 'package:flutter/widgets.dart';

class SetupController {
  final TextEditingController ageController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  bool validate() {
    int ageValue = int.parse(ageController.text);
    int weightValue = int.parse(weightController.text);

    if(ageValue < 10 || weightValue > 200) return false;
    return true;
  }

  void dispose() {
    ageController.dispose();
    weightController.dispose();
  }
}