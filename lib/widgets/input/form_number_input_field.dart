import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormNumberInputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const FormNumberInputField({
    super.key,
    required this.label,
    required this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Color(0xffBEC0C5),
            fontSize: 16,
          ),
        ),
        TextFormField(
          controller: controller,
          maxLength: 3,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          style: Theme.of(context).textTheme.bodyLarge,
          validator: validator,
        ),
      ],
    );
  }
}