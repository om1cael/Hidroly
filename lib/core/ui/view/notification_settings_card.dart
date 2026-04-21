import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hidroly/core/ui/view_model/notification_settings_card_view_model.dart';

class NotificationSettingsCard extends ConsumerWidget {
  NotificationSettingsCard({super.key});

  final availableFrequencies = [1, 2, 3];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(notificationSettingsCardViewModelProvider);

    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text('I wake up at'),
            subtitle: Text(DateFormat.jm().format(DateTime(2026, 4, 21, state.wakeUpTime.hour, state.wakeUpTime.minute))),
            leading: CircleAvatar(child: Icon(Icons.wb_sunny)),
            trailing: Icon(Icons.chevron_right),
            onTap: () async {
              final wakeUpTime = await showTimePicker(
                context: context, 
                initialTime: state.wakeUpTime,
              );

              if(wakeUpTime == null) return;

              ref
                .read(notificationSettingsCardViewModelProvider.notifier)
                .setWakeUpTime(wakeUpTime);
            },
          ),
          ListTile(
            title: Text('I go to sleep at'),
            subtitle: Text(DateFormat.jm().format(DateTime(2026, 4, 21, state.sleepTime.hour, state.sleepTime.minute))),
            leading: CircleAvatar(child: Icon(Icons.bedtime),),
            trailing: Icon(Icons.chevron_right),
            onTap: () async {
              final sleepTime = await showTimePicker(
                context: context, 
                initialTime: state.sleepTime,
              );

              if(sleepTime == null) return;

              ref
                .read(notificationSettingsCardViewModelProvider.notifier)
                .setSleepTime(sleepTime);
            },
          ),
          ListTile(
            title: Text('Remind me each'),
            subtitle: Text('${state.notificationFrequency} hours'),
            leading: CircleAvatar(child: Icon(Icons.repeat),),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              showModalBottomSheet(
                context: context, 
                builder: (context) {
                  return Consumer(
                    builder: (_, ref, _) {
                      final state = ref.watch(notificationSettingsCardViewModelProvider);
                      
                      return SafeArea(
                        child: RadioGroup<int>(
                          groupValue: state.notificationFrequency,
                          onChanged: (value) {
                            if(value == null) return;

                            ref
                              .read(notificationSettingsCardViewModelProvider.notifier)
                              .setNotificationFrequency(value);
                          }, 
                          child: Column(
                            mainAxisSize: .min,
                            children: [
                              for(final frequency in availableFrequencies)
                                ListTile(
                                  title: Text('$frequency hours'),
                                  leading: Radio<int>(value: frequency,)
                                ),
                            ],
                          )
                        ),
                      );
                    }
                  );
                }
              );
            },
          ),
        ],
      ),
    );
  }
}