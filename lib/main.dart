import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hidroly/core/themes.dart';
import 'package:hidroly/features/setup/ui/view/setup_view.dart';

void main() {
  runApp(
    ProviderScope(
      child: const MainApp()
    )
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      home: SetupView(),
    );
  }
}
