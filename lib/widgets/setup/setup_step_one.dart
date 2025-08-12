import 'package:flutter/material.dart';
import 'package:hidroly/l10n/app_localizations.dart';
import 'package:hidroly/widgets/common/icon_header.dart';
import 'package:hidroly/widgets/common/notifications_time_input.dart';

class SetupStepOne extends StatelessWidget {
  const SetupStepOne({
    super.key,
    required this.wakeUpTime,
    required this.sleepTime,
  });

  final ValueNotifier<TimeOfDay> wakeUpTime;
  final ValueNotifier<TimeOfDay> sleepTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 32,
      children: [
        IconHeader(
          iconAsset: 'assets/images/notifications.svg', 
          title: AppLocalizations.of(context)!.notificationSetupTitle, 
          description: AppLocalizations.of(context)!.notificationSetupDescription,
        ),
        NotificationsTimeInput(
          wakeUpTime: wakeUpTime,
          sleepTime: sleepTime,
        )
      ],
    );
  }
}