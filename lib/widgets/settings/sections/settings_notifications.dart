import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:hidroly/data/model/enum/frequency.dart';
import 'package:hidroly/l10n/app_localizations.dart';
import 'package:hidroly/pages/settings/settings_frequency_page.dart';
import 'package:hidroly/pages/settings/settings_update_sleep_schedule_page.dart';
import 'package:hidroly/provider/settings_provider.dart';
import 'package:hidroly/theme/app_colors.dart';
import 'package:hidroly/utils/time_utils.dart';
import 'package:hidroly/widgets/settings/settings_text_button.dart';
import 'package:provider/provider.dart';

class SettingsNotifications extends StatefulWidget {
  const SettingsNotifications({
    super.key,
  });

  @override
  State<SettingsNotifications> createState() => _SettingsNotificationsState();
}

class _SettingsNotificationsState extends State<SettingsNotifications> {
  int frequency = Frequency.every2Hours.frequency;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      frequency = await _loadFrequency();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsProvider>(
      builder: (context, provider, child) {
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
              title: AppLocalizations.of(context)!.settingsNotificationsFrequency,
              description: TimeUtils.getTimeString(provider.frequency!, context),
              onPressed: () async {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const SettingsFrequencyPage()),
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
    );
  }

  Future<int> _loadFrequency() async {
    final provider = context.read<SettingsProvider>();
    await provider.readFrequency();
    return provider.frequency!;
  }
}