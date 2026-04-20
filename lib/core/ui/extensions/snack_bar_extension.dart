import 'package:flutter/material.dart';

extension SnackBarExtension on BuildContext {
  void showSnackBar(String message, [bool isError = false]) {
    ScaffoldMessenger.of(this).clearSnackBars();

    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: Theme.of(this).textTheme.labelLarge,
        ),
        behavior: .floating,
        backgroundColor: isError   
          ? Theme.of(this).colorScheme.errorContainer 
          : Theme.of(this).colorScheme.surfaceContainer,
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(12)),
      ),
    );
  }
}