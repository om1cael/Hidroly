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
            title: Text('exportData'.tr()),
            subtitle: Text('exportDesc'.tr()),
            onTap: () async {
                final exportResult = 
                  await ref.read(settingsViewModelProvider.notifier).exportData();

                exportResult.fold(
                  (status) {
                    if(status == .success) {
                      context.showSnackBar('exportSuccessful'.tr());
                    }
                  },
                  (failure) => context.showSnackBar('errorOccurred'.tr(), true),
                );
            },
          ),
          ListTile(
            leading: CircleAvatar(child: Icon(Icons.settings_backup_restore),),
            title: Text('importData'.tr()),
            subtitle: Text('importDesc'.tr()),
            onTap: () async {
              final result =
                await ref.read(settingsViewModelProvider.notifier).importData();
              
              result.fold(
                (success) => context.showSnackBar('importSuccessful'.tr()), 
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