import 'package:flutter/material.dart';
import 'package:hidroly/data/model/enum/frequency.dart';
import 'package:hidroly/l10n/app_localizations.dart';
import 'package:hidroly/pages/settings/settings_frequency_page.dart';
import 'package:hidroly/theme/app_colors.dart';
import 'package:hidroly/utils/time_utils.dart';

class NotificationsTimeInput extends StatefulWidget {
  final ValueNotifier<TimeOfDay> wakeUpTime;
  final ValueNotifier<TimeOfDay> sleepTime;
  final ValueNotifier<Frequency> frequency;

  const NotificationsTimeInput({
    super.key,
    required this.wakeUpTime,
    required this.sleepTime,
    required this.frequency,
  });

  @override
  State<NotificationsTimeInput> createState() => _NotificationsTimeInputState();
}

class _NotificationsTimeInputState extends State<NotificationsTimeInput> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.onBackground,
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.sunny),
            title: Text(
              AppLocalizations.of(context)!.notificationsSettingsWakeUp,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            subtitle: Text(
              widget.wakeUpTime.value.format(context),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            trailing: Icon(Icons.arrow_forward),
            iconColor: AppColors.primaryText,
            onTap: () async {
              final newTime = await showTimePicker(
                context: context, 
                initialTime: widget.wakeUpTime.value
              );

              if(newTime != null) {
                setState(() {
                  widget.wakeUpTime.value = newTime;
                });
              }
            },
          ),
          ListTile(
            leading: Icon(Icons.nights_stay),
            title: Text(
              AppLocalizations.of(context)!.notificationsSettingsSleep,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            subtitle: Text(
              widget.sleepTime.value.format(context),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            trailing: Icon(Icons.arrow_forward),
            iconColor: AppColors.primaryText,
            onTap: () async {
              final newTime = await showTimePicker(
                context: context, 
                initialTime: widget.sleepTime.value
              );

              if(newTime != null) {
                setState(() {
                  widget.sleepTime.value = newTime;
                });
              }
            },
          ),
          ListTile(
            leading: Icon(Icons.schedule),
            title: Text(
              AppLocalizations.of(context)!.settingsNotificationsFrequency,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            subtitle: Text(
             TimeUtils.getTimeString(widget.frequency.value.frequency, context),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            trailing: Icon(Icons.arrow_forward),
            iconColor: AppColors.primaryText,
            onTap: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => SettingsFrequencyPage(frequency: widget.frequency,)),
              );

              setState(() {
                widget.frequency.value;
              });       
            },
          ),
        ],
      ),
    );
  }
}