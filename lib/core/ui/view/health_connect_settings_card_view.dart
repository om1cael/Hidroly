import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hidroly/core/ui/view_model/health_connect_settings_card_view_model.dart';

class HealthConnectSettingsCardView extends ConsumerWidget {
  const HealthConnectSettingsCardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(healthConnectSettingsCardViewModelProvider);

    ref.listen(healthConnectSettingsCardViewModelProvider, (previous, next) {
      if(next.value == null) return;
      
      if(!next.requireValue.enabled) {
        showDialog(
          context: context, 
          builder: (context) => AlertDialog(
            title: Text('Important'),
            content: Text('You need to close the app to apply this change, or go to the Health Connect settings and revoke the permission.\n\nAfter you do it, the data will not be synced with Health Connect anymore.'),
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
              title: Text('Enable'),
              subtitle: Text(
                data.enabled ? 'Data will be synced' : 'No data being sync', 
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
          ],
        ),
      ),
    );
  }
}