import 'package:flutter/material.dart';
import 'package:hidroly/data/model/enum/settings.dart';
import 'package:hidroly/l10n/app_localizations.dart';
import 'package:hidroly/provider/settings_provider.dart';
import 'package:hidroly/services/notification_service.dart';
import 'package:hidroly/theme/app_colors.dart';
import 'package:hidroly/widgets/common/icon_header.dart';
import 'package:hidroly/widgets/common/notifications_time_input.dart';
import 'package:provider/provider.dart';

class SettingsUpdateSleepSchedulePage extends StatefulWidget {
  const SettingsUpdateSleepSchedulePage({super.key});

  @override
  State<SettingsUpdateSleepSchedulePage> createState() => _SettingsUpdateSleepSchedulePageState();
}

class _SettingsUpdateSleepSchedulePageState extends State<SettingsUpdateSleepSchedulePage> {
  var wakeUpTime = ValueNotifier(
    TimeOfDay(hour: 6, minute: 0)
  );

  var sleepTime = ValueNotifier(
    TimeOfDay(hour: 22, minute: 0)
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getCurrentSleepSchedule();
    });
  }

  Future<void> _getCurrentSleepSchedule() async {
    final provider = context.read<SettingsProvider>();
    await provider.readTime(Settings.wakeUpTime);
    await provider.readTime(Settings.sleepTime);

    if(provider.wakeUpTime != null && provider.sleepTime != null) {
      setState(() {
        wakeUpTime.value = provider.wakeUpTime!;
        sleepTime.value = provider.sleepTime!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settingsSleepScheduleAppBar),
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          }, 
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.primaryText,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  IconHeader(
                    iconAsset: 'assets/images/water-drop.svg', 
                    title: AppLocalizations.of(context)!.settingsSleepScheduleTitle, 
                    description: AppLocalizations.of(context)!.settingsSleepScheduleDescription
                  ),
                  SizedBox(height: 32,),
                  NotificationsTimeInput(
                    wakeUpTime: wakeUpTime, 
                    sleepTime: sleepTime
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final settingsProvider = context.read<SettingsProvider>();

          await settingsProvider.updateTime(
            Settings.wakeUpTime, 
            wakeUpTime.value.hour, 
            wakeUpTime.value.minute,
          );

          await settingsProvider.updateTime(
            Settings.sleepTime, 
            sleepTime.value.hour, 
            sleepTime.value.minute,
          );

          if(!context.mounted) return;
          final saved = await NotificationService().registerPeriodicNotificationTask(
            context, 
            settingsProvider
          );

          if(!saved && context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(
                AppLocalizations.of(context)!.sleepScheduleEditFailed,
                style: Theme.of(context).textTheme.bodyLarge,
              )),
            );

            return;
          }

          if(!context.mounted) return;
          Navigator.of(context).pop(true);
        },
        backgroundColor: AppColors.primaryText,
        child: Icon(Icons.done), 
      ),
    );
  }
}