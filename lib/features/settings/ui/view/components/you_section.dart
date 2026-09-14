import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hidroly/features/settings/ui/view/components/personal_goal_sheet.dart';

class SettingsYouSection extends ConsumerWidget {
  const SettingsYouSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text('personalGoal'.tr()),
            subtitle: Text('personalGoalSettingsExplain'.tr()),
            leading: CircleAvatar(child: Icon(Icons.person),),
            onTap: () async {
              return showModalBottomSheet(
                isScrollControlled: true,
                context: context, 
                builder: (_) {
                  return PersonalGoalSheet();
                }
              );
            },
          ),
          ListTile(
            title: Text('notifications'.tr()),
            subtitle: Text('notificationsAdjust'.tr()),
            leading: CircleAvatar(child: Icon(Icons.notifications),),
            trailing: Icon(Icons.chevron_right),
            onTap: () => context.push('/settings/notifications'),
          ),
          ListTile(
            title: Text('healthConnect'.tr()),
            subtitle: Text('healthConnectShortDescription'.tr()),
            leading: CircleAvatar(child: Icon(Icons.monitor_heart),),
            trailing: Icon(Icons.chevron_right),
            onTap: () => context.push('/settings/health-connect'),
          ),
        ],
      ),
    );
  }
}