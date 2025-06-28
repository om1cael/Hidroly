import 'package:flutter/material.dart';
import 'package:hidroly/pages/home_page.dart';
import 'package:hidroly/pages/setup_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      home: SetupPage(),
    );
  }
}
