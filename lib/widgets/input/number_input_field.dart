import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberInputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const NumberInputField({
    super.key,
    required this.label,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
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
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            filled: true,
            fillColor: Color(0xff31333A),
            counterStyle: TextStyle(
              color: Color(0xffBEC0C5),
            ),
          ),
          style: TextStyle(
            color: Color(0xffF9F9F9),
          ),
        ),
      ],
    );
  }
}