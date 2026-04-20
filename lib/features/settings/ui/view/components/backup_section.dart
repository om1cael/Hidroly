import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hidroly/core/domain/exceptions/invalid_input_exception.dart';
import 'package:hidroly/core/domain/exceptions/unsupported_database_exception.dart';
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
              try {
                await ref.read(settingsViewModelProvider.notifier).exportData();

                if(!context.mounted) return;

                context.showSnackBar('All set! Your hydration history is safe.');
              } catch (_) {
                context.showSnackBar('Oops! Something went wrong.');
              }
            },
          ),
          ListTile(
            leading: CircleAvatar(child: Icon(Icons.settings_backup_restore),),
            title: Text('Import data'),
            subtitle: Text('Restore your days, history, and cups'),
            onTap: () async {
              final result =
                await ref.read(settingsViewModelProvider.notifier).importData();
              
              result.fold(
                (success) => context.showSnackBar('Your data has been imported!'), 
                (failure) {
                  final message = switch(failure) {
                    UnsupportedDatabaseException() => 'importDatabaseUnsupported'.tr(),
                    InvalidInputException() => 'importInvalidJson'.tr(),
                    _ => 'errorOccurred'.tr(),
                  };

                  context.showSnackBar(message, true);
                }
              );
            },
          ),
        ],
      ),
    );
  }
}