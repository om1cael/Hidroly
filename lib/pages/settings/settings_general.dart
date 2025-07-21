import 'package:flutter/material.dart';
import 'package:hidroly/l10n/app_localizations.dart';
import 'package:hidroly/pages/settings/settings_unit_page.dart';
import 'package:hidroly/theme/app_colors.dart';

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
          AppLocalizations.of(context)!.settingsGeneral,
          style: TextStyle(
            color: AppColors.primaryText,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.zero
              ),
              alignment: Alignment.centerLeft,
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const SettingsUnitPage()),
              );
            }, 
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppLocalizations.of(context)!.settingsUnitSystem),
                Text(
                  isMetric
                    ? AppLocalizations.of(context)!.metric
                    : AppLocalizations.of(context)!.imperial,
                  style: TextStyle(
                    color: AppColors.secondaryText,
                  ),
                )
              ],
            )
          ),
        )
      ],
    );
  }
}