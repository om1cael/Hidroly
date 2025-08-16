import 'package:flutter/material.dart';
import 'package:hidroly/l10n/app_localizations.dart';
import 'package:hidroly/main.dart';

class SettingsThemePage extends StatefulWidget {
  const SettingsThemePage({super.key});

  @override
  State<SettingsThemePage> createState() => _SettingsThemePageState();
}

class _SettingsThemePageState extends State<SettingsThemePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settingsUnitSystem),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          }, 
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
        titleSpacing: 0,
      ),
      body: Column(
        children: [
          RadioListTile(
            title: Text(
              'System',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            value: ThemeMode.system, 
            groupValue: MainApp.themeNotifier.value,
            onChanged: (val) => _updateTheme(val),
          ),
          RadioListTile(
            title: Text(
              'Light',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            value: ThemeMode.light, 
            groupValue: MainApp.themeNotifier.value,
            onChanged: (val) => _updateTheme(val),
          ),
          RadioListTile(
            title: Text(
              'Dark',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            value: ThemeMode.dark, 
            groupValue: MainApp.themeNotifier.value,
            onChanged: (val) => _updateTheme(val),
          ),
        ],
      ),
    );
  }

  void _updateTheme(ThemeMode? theme) {
    MainApp.themeNotifier.value = theme!;
  }
}