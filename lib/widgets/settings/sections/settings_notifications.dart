import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:hidroly/l10n/app_localizations.dart';
import 'package:hidroly/pages/settings/settings_update_sleep_schedule_page.dart';
import 'package:hidroly/theme/app_colors.dart';
import 'package:hidroly/widgets/settings/settings_text_button.dart';

class SettingsNotifications extends StatefulWidget {
  const SettingsNotifications({
    super.key,
  });

  @override
  State<SettingsNotifications> createState() => _SettingsNotificationsState();
}

class _SettingsNotificationsState extends State<SettingsNotifications> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.settingsNotificationsSection,
          style: TextStyle(
            color: Theme.of(context).textTheme.labelLarge!.color,
            fontWeight: FontWeight.bold,
          ),
        ),
        SettingsTextButton(
          title: AppLocalizations.of(context)!.manageAction,
          description: AppLocalizations.of(context)!.settingsNotificationsManageDescription,
          onPressed: () async {
            AppSettings.openAppSettings(
              type: AppSettingsType.notification,
            );
          },
        ),
        SettingsTextButton(
          title: AppLocalizations.of(context)!.settingsSleepSchedule,
          description: AppLocalizations.of(context)!.settingsNotificationsSleepScheduleDescription,
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const SettingsUpdateSleepSchedulePage())
            );
          }
        ),
      ],
    );
  }
}