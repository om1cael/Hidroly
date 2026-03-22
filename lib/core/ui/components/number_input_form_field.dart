import 'package:flutter/material.dart';

class NumberInputFormField extends StatelessWidget {
  const NumberInputFormField({
    super.key,
    required this.controller,
    required this.label,
    this.hintText,
    required this.maxLength,
    this.suffix,
    this.autoFocus,
    required this.validator,
  });

  final TextEditingController controller;

  final String label;
  final String? hintText;
  final String? suffix;
  final int maxLength;

  final bool? autoFocus;

  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        label: Text(label),
        suffixText: suffix,
        counterText: "",
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      controller: controller,
      keyboardType: TextInputType.number,
      autovalidateMode: AutovalidateMode.onUnfocus,
      autocorrect: false,
      maxLength: maxLength,
      validator: validator,
      autofocus: autoFocus ?? false,
    );
  }
}