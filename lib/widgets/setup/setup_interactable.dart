import 'package:flutter/material.dart';
import 'package:hidroly/widgets/input/number_input_field.dart';

class SetupInteractable extends StatelessWidget {
  const SetupInteractable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        spacing: 10,
        children: [
          NumberInputField(label: 'Your age'),
          NumberInputField(label: 'Your weight'),
        ],
      ),
    );
  }
}