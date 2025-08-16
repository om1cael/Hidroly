import 'package:flutter/material.dart';
import 'package:hidroly/l10n/app_localizations.dart';
import 'package:hidroly/pages/settings/settings_theme_page.dart';
import 'package:hidroly/pages/settings/settings_unit_page.dart';
import 'package:hidroly/widgets/settings/settings_text_button.dart';

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
          title: 'Theme',
          description: 'System',
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
      ],
    );
  }
}