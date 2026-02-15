import 'package:flutter/material.dart';

class NumberInputFormField extends StatelessWidget {
  const NumberInputFormField({
    super.key,
    required this.label,
    required this.maxLength,
    this.suffix,
  });

  final String label;
  final String? suffix;
  final int maxLength;

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
      autocorrect: false,
      maxLength: maxLength,
    );
  }
}