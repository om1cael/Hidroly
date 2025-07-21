import 'package:flutter/material.dart';
import 'package:hidroly/l10n/app_localizations.dart';
import 'package:hidroly/pages/settings/settings_unit_page.dart';
import 'package:hidroly/provider/settings_provider.dart';
import 'package:hidroly/theme/app_colors.dart';
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
            onPressed: () async {
              final result = await Navigator.of(context).push<bool>(
                MaterialPageRoute(builder: (context) => const SettingsUnitPage()),
              );

              print(result);

              if(result != null && context.mounted) {
                context.read<SettingsProvider>().updateIsMetric(result);
              }
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