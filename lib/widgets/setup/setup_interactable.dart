import 'package:flutter/material.dart';
import 'package:hidroly/controller/setup_controller.dart';
import 'package:hidroly/widgets/input/number_input_field.dart';

class SetupInteractable extends StatelessWidget {
  final SetupController setupController = SetupController();

  SetupInteractable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        spacing: 10,
        children: [
          NumberInputField(controller: setupController.ageController, label: 'Your age'),
          NumberInputField(controller: setupController.weightController, label: 'Your weight'),
        ],
      ),
    );
  }
}