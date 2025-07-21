import 'package:flutter/material.dart';
import 'package:hidroly/widgets/input/form_number_input_field.dart';

class NumberInputDialog extends StatelessWidget {
  final String title;
  final String inputFieldLabel;
  final String actionButtonText;
  final String cancelButtonText;
  final TextEditingController textEditingController;

  final String? Function(String?)? inputFieldValidator;
  final VoidCallback onActionPressed;
  final VoidCallback onCancelPressed;

  final bool inputIsDecimal;
  final int inputMaxLength;

  const NumberInputDialog({
    super.key,
    required this.title,
    required this.inputFieldLabel,
    required this.actionButtonText,
    required this.cancelButtonText,
    required this.inputFieldValidator,
    required this.onActionPressed,
    required this.onCancelPressed,
    this.inputIsDecimal = true,
    this.inputMaxLength = 4,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      content: FormNumberInputField(
        label: inputFieldLabel, 
        controller: textEditingController, 
        validator: inputFieldValidator,
        decimal: inputIsDecimal,
        maxLength: inputMaxLength,
      ),
      actions: [
        TextButton(
          onPressed: onActionPressed, 
          child: Text(actionButtonText),
        ),
        TextButton(
          onPressed: onCancelPressed, 
          child: Text(cancelButtonText)
        )
      ],
    );
  }
}