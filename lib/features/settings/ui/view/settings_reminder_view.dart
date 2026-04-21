import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hidroly/core/ui/view/notification_settings_card.dart';

class SettingsReminderView extends StatelessWidget {
  const SettingsReminderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        minimum: EdgeInsets.all(16),
        child: CustomScrollView(
          physics: ClampingScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              child: Column(
                mainAxisAlignment: .center,
                crossAxisAlignment: .center,
                spacing: 32,
                children: [
                  Column(
                    mainAxisAlignment: .center,
                    crossAxisAlignment: .center,
                    spacing: 24,
                    children: [
                      CircleAvatar(radius: 64, child: Icon(Icons.edit_notifications, size: 64,)),
                      Text('notificationsAdjust'.tr(), style: Theme.of(context).textTheme.titleLarge,)
                    ],
                  ),
                  SizedBox(height: 16,),
                  NotificationSettingsCard(),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'hydrationHint'.tr(), 
                        textAlign: .center,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}