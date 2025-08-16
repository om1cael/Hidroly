import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormNumberInputField extends StatelessWidget {
  final String label;
  final bool decimal;
  final int maxLength;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const FormNumberInputField({
    super.key,
    required this.label,
    this.decimal = false,
    this.maxLength = 3,
    required this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    TextInputType inputType = decimal
      ? TextInputType.numberWithOptions(decimal: true)
      : TextInputType.number;

    TextInputFormatter inputFormatter = decimal
      ? FilteringTextInputFormatter.allow(RegExp(r'^\d+(\.\d*)?'))
      : FilteringTextInputFormatter.digitsOnly;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.labelLarge
        ),
        TextFormField(
          controller: controller,
          maxLength: maxLength,
          keyboardType: inputType,
          inputFormatters: [inputFormatter],
          style: Theme.of(context).textTheme.bodyLarge,
          validator: validator,
        ),
      ],
    );
  }
}