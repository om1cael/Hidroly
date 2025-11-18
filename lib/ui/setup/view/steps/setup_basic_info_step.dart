import 'package:flutter/material.dart';
import 'package:hidroly/l10n/app_localizations.dart';
import 'package:hidroly/widgets/common/daily_goal_input.dart';
import 'package:hidroly/widgets/common/icon_header.dart';

class SetupBasicInfoStep extends StatelessWidget {
  const SetupBasicInfoStep({
    super.key,
    required this.ageController,
    required this.weightController,
    required this.isMetric,
  });

  final TextEditingController ageController;
  final TextEditingController weightController;
  final ValueNotifier<bool> isMetric;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconHeader(
          iconAsset: 'assets/images/water-drop.svg', 
          title: AppLocalizations.of(context)!.setupWelcomeTitle, 
          description: AppLocalizations.of(context)!.setupWelcomeSubtitle,
        ),
        DailyGoalInput(
          ageController: ageController,
          weightController: weightController,
          isMetric: isMetric,
        ),
        Text(
          AppLocalizations.of(context)!.setupDataText,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}