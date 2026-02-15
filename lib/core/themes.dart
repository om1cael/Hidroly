import 'package:flutter/material.dart';

class Themes {
  static ThemeData get lightTheme {
    return ThemeData(
      colorSchemeSeed: Colors.blueAccent,
      brightness: Brightness.light,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      colorSchemeSeed: Colors.blueAccent,
      brightness: Brightness.dark,
    );
  }
}