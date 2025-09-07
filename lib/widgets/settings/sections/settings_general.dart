import 'package:flutter/material.dart';
import 'package:hidroly/l10n/app_localizations.dart';
import 'package:hidroly/main.dart';
import 'package:hidroly/pages/settings/settings_theme_page.dart';
import 'package:hidroly/pages/settings/settings_unit_page.dart';
import 'package:hidroly/provider/settings_provider.dart';
import 'package:hidroly/widgets/settings/settings_switch.dart';
import 'package:hidroly/widgets/settings/settings_text_button.dart';
import 'package:provider/provider.dart';

class SettingsGeneral extends StatelessWidget {
  final bool isMetric;

  const SettingsGeneral({
    super.key,
    required this.isMetric,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.settingsGeneralSection,
          style: TextStyle(
            color: Theme.of(context).textTheme.labelLarge!.color,
            fontWeight: FontWeight.bold,
          ),
        ),
        SettingsTextButton(
          title: AppLocalizations.of(context)!.settingsTheme,
          description: _getThemeName(MainApp.themeNotifier.value, context),
          onPressed: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const SettingsThemePage()),
            );
          },
        ),
        SettingsTextButton(
          title: AppLocalizations.of(context)!.settingsUnitSystem,
          description: isMetric
              ? AppLocalizations.of(context)!.metric
              : AppLocalizations.of(context)!.imperial,
          onPressed: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const SettingsUnitPage()),
            );
          },
        ),
        Consumer<SettingsProvider>(
          builder: (context, provider, _) {
            return SettingsSwitch(
              title: AppLocalizations.of(context)!.settingsHapticFeedback,
              switchValue: provider.hapticFeedback,
              onChanged: (value) {
                context.read<SettingsProvider>().updateHapticFeedback(value);
              },
            );
          }
        ),
      ],
    );
  }

  String _getThemeName(ThemeMode themeMode, BuildContext context) {
    final Map<ThemeMode, String> themeValueMap = {
      ThemeMode.system: AppLocalizations.of(context)!.system,
      ThemeMode.light: AppLocalizations.of(context)!.light,
      ThemeMode.dark: AppLocalizations.of(context)!.dark,
    };

    return themeValueMap[themeMode]!;
  }
}