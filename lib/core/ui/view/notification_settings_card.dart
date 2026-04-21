import 'package:flutter/material.dart';

class NotificationSettingsCard extends StatelessWidget {
  NotificationSettingsCard({super.key});

  final availableFrequencies = [1, 2, 3];

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text('I wake up at'),
            subtitle: Text('8:00 AM'),
            leading: CircleAvatar(child: Icon(Icons.wb_sunny)),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              showTimePicker(
                context: context, 
                initialTime: TimeOfDay(hour: 8, minute: 0),
              );
            },
          ),
          ListTile(
            title: Text('I go to sleep at'),
            subtitle: Text('8:00 PM'),
            leading: CircleAvatar(child: Icon(Icons.bedtime),),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              showTimePicker(
                context: context, 
                initialTime: TimeOfDay(hour: 20, minute: 0),
              );
            },
          ),
          ListTile(
            title: Text('Remind me each'),
            subtitle: Text('2 hours'),
            leading: CircleAvatar(child: Icon(Icons.repeat),),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              showModalBottomSheet(
                context: context, 
                builder: (_) {
                  return SafeArea(
                    child: RadioGroup(
                      onChanged: (_) {}, 
                      child: Column(
                        mainAxisSize: .min,
                        children: [
                          for(final frequency in availableFrequencies)
                            ListTile(
                              title: Text('$frequency hours'),
                              leading: Radio(value: frequency)
                            ),
                        ],
                      )
                    ),
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