import 'package:flutter/material.dart';
import 'package:hidroly/widgets/input/form_number_input_field.dart';

class SetupInteractable extends StatelessWidget {
  final TextEditingController ageController;
  final TextEditingController weightController;

  const SetupInteractable({
    super.key,
    required this.ageController,
    required this.weightController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        spacing: 10,
        children: [
          FormNumberInputField(
            controller: ageController, 
            label: 'Your age',
            validator: (value) {
              final age = int.tryParse(value ?? '');
              if(age == null || age < 10 || age > 120) return 'Age between 10 and 120';
              return null;
            },
          ),
          FormNumberInputField(
            controller: weightController, 
            label: 'Your weight',
            validator: (value) {
              final weight = int.tryParse(value ?? '');
              if(weight == null || weight < 30 || weight > 200) return 'Weight between 30 and 200';
              return null;
            },
          ),
        ],
      ),
    );
  }
}