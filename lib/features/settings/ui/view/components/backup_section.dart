import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hidroly/core/ui/extensions/snack_bar_extension.dart';
import 'package:hidroly/features/settings/ui/view_model/settings_view_model.dart';

class SettingsBackupSection extends ConsumerWidget {
  const SettingsBackupSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(child: Icon(Icons.backup),),
            title: Text('Export data'),
            subtitle: Text('Backup your days, history, and cups'),
            onTap: () async {
              final hasBeenExported =
                await ref.read(settingsViewModelProvider.notifier).exportData();
              
              if(!context.mounted) return;

              if(hasBeenExported) {
                context.showSnackBar('Your data has been exported successfully');
              } else {
                context.showSnackBar('Failed to export your data');
              }
            },
          ),
          ListTile(
            leading: CircleAvatar(child: Icon(Icons.settings_backup_restore),),
            title: Text('Import data'),
            subtitle: Text('Restore your days, history, and cups'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}