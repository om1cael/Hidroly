import 'package:flutter/material.dart';
import 'package:hidroly/pages/home_page.dart';
import 'package:hidroly/provider/user_provider.dart';
import 'package:hidroly/theme/app_theme.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: const MainApp(),
    )
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.darkTheme,
      home: ChangeNotifierProvider(
        create: (context) => UserProvider(),
        builder: (context, child) => const HomePage(),
      )
    );
  }
}
