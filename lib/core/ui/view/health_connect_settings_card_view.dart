import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hidroly/core/ui/view_model/health_connect_settings_card_view_model.dart';

class HealthConnectSettingsCardView extends ConsumerWidget {
  const HealthConnectSettingsCardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(healthConnectSettingsCardViewModelProvider);

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
              onTap: () async {
              },
            ),
          ],
        ),
      ),
    );
  }
}