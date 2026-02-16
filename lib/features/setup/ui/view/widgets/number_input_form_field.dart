import 'package:flutter/material.dart';

class NumberInputFormField extends StatelessWidget {
  const NumberInputFormField({
    super.key,
    required this.label,
    required this.maxLength,
    this.suffix,
    required this.validator,
  });

  final String label;
  final String? suffix;
  final int maxLength;

  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        label: Text(label),
        suffixText: suffix,
        counterText: "",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      keyboardType: TextInputType.number,
      autovalidateMode: AutovalidateMode.onUnfocus,
      autocorrect: false,
      maxLength: maxLength,
      validator: validator,
    );
  }
}