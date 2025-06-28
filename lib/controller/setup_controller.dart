import 'package:flutter/widgets.dart';

class SetupController {
  final TextEditingController ageController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void onSubmit() {
    if(formKey.currentState!.validate()) {
      // save things
      print('Age: ${ageController.text}, Weight: ${weightController.text}');
    }
  }

  void dispose() {
    ageController.dispose();
    weightController.dispose();
  }
}