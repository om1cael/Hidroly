import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hidroly/core/data/repositories/backup_repository_impl.dart';
import 'package:hidroly/infra/backup/backup_file_service.dart';

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
            onTap: () => ref.read(backupRepositorProvider).exportData(),
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