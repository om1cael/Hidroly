import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:hidroly/l10n/app_localizations.dart';
import 'package:hidroly/pages/settings/settings_update_sleep_schedule_page.dart';
import 'package:hidroly/theme/app_colors.dart';
import 'package:hidroly/widgets/settings/settings_text_button.dart';

class SettingsNotifications extends StatelessWidget {
  const SettingsNotifications({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.settingsNotificationsSection,
          style: TextStyle(
            color: AppColors.primaryText,
            fontWeight: FontWeight.bold,
          ),
        ),
        SettingsTextButton(
          title: AppLocalizations.of(context)!.manageAction,
          onPressed: () async {
            AppSettings.openAppSettings(
              type: AppSettingsType.notification,
            );
          },
        ),
        SettingsTextButton(
          title: AppLocalizations.of(context)!.settingsSleepSchedule,
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