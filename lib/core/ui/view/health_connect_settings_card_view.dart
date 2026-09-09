import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hidroly/core/ui/extensions/snack_bar_extension.dart';
import 'package:hidroly/core/ui/view_model/health_connect_settings_card_view_model.dart';

class HealthConnectSettingsCardView extends ConsumerWidget {
  const HealthConnectSettingsCardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(healthConnectSettingsCardViewModelProvider);

    ref.listen(healthConnectSettingsCardViewModelProvider, (previous, next) {
      if(previous == null || next.value == null) return;
      
      if((previous.hasValue && previous.requireValue.enabled) && !next.requireValue.enabled) {
        showDialog(
          context: context, 
          builder: (context) => AlertDialog(
            title: Text('important'.tr()),
            content: Text('healthConnectDisable'.tr()),
            actions: [
              TextButton(onPressed: () => Navigator.of(context).pop(), child: Text('understand'.tr()))
            ],
          )
        );
      }

      if((previous.hasValue && !previous.requireValue.askForAppSettingsRedirect) && next.requireValue.askForAppSettingsRedirect) {
        showDialog(
          context: context, 
          builder: (context) => AlertDialog(
            title: Text('healthConnectEnableFailTitle'.tr()),
            content: Text('healthConnectEnableFail'.tr()),
            actions: [
              TextButton(onPressed: () => Navigator.of(context).pop(), child: Text('ok'.tr()))
            ],
          )
        );
      }
    });

    return state.when(
      error: (_, _) => Text('errorOccurred'.tr()), 
      loading: () => Center(child: CircularProgressIndicator(),),
      data: (data) => Card(
        child: Column(
          children: [
            ListTile(
              title: Text('enable'.tr()),
              subtitle: Text(
                data.enabled ? 'healthConnectSyncOn'.tr() : 'healthConnectSyncOff'.tr(), 
                style: Theme.of(context).textTheme.bodySmall,
              ),
              leading: CircleAvatar(child: Icon(Icons.power_settings_new)),
              trailing: Switch(
                value: data.enabled, 
                onChanged: (value) {
                  ref.read(healthConnectSettingsCardViewModelProvider.notifier)
                    .changeSyncState(value);
                }
              ),
            ),
            ListTile(
              title: Text('Send history'),
              subtitle: Text(
                'Export past entries to Health Connect',
                style: TextStyle(
                  fontSize: 12
                ),
              ),
              leading: CircleAvatar(child: Icon(Icons.upload)),
              onTap: () {
                ref
                  .read(healthConnectSettingsCardViewModelProvider.notifier)
                  .exportEntries();
              },
              enabled: data.enabled,
            ),
          ],
        ),
      ),
    );
  }
}