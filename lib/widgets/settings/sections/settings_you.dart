import 'package:flutter/material.dart';
import 'package:hidroly/l10n/app_localizations.dart';
import 'package:hidroly/provider/day_provider.dart';
import 'package:hidroly/theme/app_colors.dart';
import 'package:hidroly/utils/unit_tools.dart';
import 'package:hidroly/widgets/settings/settings_text_button.dart';
import 'package:provider/provider.dart';

class SettingsYou extends StatelessWidget {  
  final bool isMetric;

  const SettingsYou({
    super.key,
    required this.isMetric,
  });

  @override
  Widget build(BuildContext context) {
    final day = context.watch<DayProvider>().day;
    String? dailyGoalDescription;

    if(day != null) {
      final dailyGoal = day.dailyGoal;
      dailyGoalDescription = UnitTools.getVolumeWithUnit(dailyGoal, isMetric);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.settingsYouSection,
          style: TextStyle(
            color: AppColors.primaryText,
            fontWeight: FontWeight.bold,
          ),
        ),
        SettingsTextButton(
          title: AppLocalizations.of(context)!.settingsUpdateYourDailyGoal,
          description: dailyGoalDescription,
          onPressed: () {},
        ),
        SettingsTextButton(
          title: AppLocalizations.of(context)!.settingsSetCustomDailyGoal,
          onPressed: () {},
        ),
      ],
    );
  }
}