import 'package:flutter/material.dart';
import 'package:hidroly/pages/home_page.dart';
import 'package:hidroly/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.darkTheme,
      home: HomePage(),
    );
  }
}
