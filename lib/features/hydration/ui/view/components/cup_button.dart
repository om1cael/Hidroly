import 'package:flutter/material.dart';

class CupButton extends StatelessWidget {
  const CupButton({
    super.key,
    required this.amount,
    required this.unit,
    required this.onPressed,
  });

  final int amount;
  final String unit;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: onPressed, 
      icon: Icon(Icons.water_drop),
      label: Text('$amount $unit'),
    );
  }
}