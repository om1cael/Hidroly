import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
            title: Text('notifications'.tr()),
            subtitle: Text('notificationsAdjust'.tr()),
            leading: CircleAvatar(child: Icon(Icons.notifications),),
            trailing: Icon(Icons.chevron_right),
            onTap: () => context.push('/settings/notifications'),
          ),
        ],
      ),
    );
  }
}