import 'package:flutter/material.dart';
import 'package:hidroly/l10n/app_localizations.dart';
import 'package:hidroly/pages/settings/settings_unit_page.dart';
import 'package:hidroly/theme/app_colors.dart';
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
            color: AppColors.primaryText,
            fontWeight: FontWeight.bold,
          ),
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
        )
      ],
    );
  }
}