import 'package:flutter/material.dart';
import 'package:hidroly/l10n/app_localizations.dart';
import 'package:hidroly/main.dart';
import 'package:hidroly/provider/settings_provider.dart';
import 'package:provider/provider.dart';

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
        title: Text(AppLocalizations.of(context)!.settingsTheme),
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
              AppLocalizations.of(context)!.system,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            value: ThemeMode.system, 
            groupValue: MainApp.themeNotifier.value,
            onChanged: (val) => _updateTheme(val),
          ),
          RadioListTile(
            title: Text(
              AppLocalizations.of(context)!.light,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            value: ThemeMode.light, 
            groupValue: MainApp.themeNotifier.value,
            onChanged: (val) => _updateTheme(val),
          ),
          RadioListTile(
            title: Text(
              AppLocalizations.of(context)!.dark,
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
    context.read<SettingsProvider>().updateTheme(theme);
  }
}