import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hidroly/features/hydration/ui/extensions/unit_system_ui_extension.dart';
import 'package:hidroly/features/hydration/ui/view_model/hydration_view_model.dart';

class HistoryModal extends ConsumerWidget {
  const HistoryModal({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateModal = ref.watch(hydrationViewModelProvider);

    return stateModal.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Error: $err')),
      data: (data) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          left: 20,
          right: 20,
          top: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('History', style: Theme.of(context).textTheme.titleLarge,),
            SizedBox(height: 12,),
            Expanded(
              child: ListView.separated(
                itemCount: data.history.length,
                shrinkWrap: true,
                itemBuilder: (_, index) {
                  final historyItem = data.history[index];
              
                  return Card.filled(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Icon(Icons.water_drop),
                      ),
                      title: Text('historyItemTitle'.tr(
                        namedArgs: {
                          'amount': historyItem.amount.valueIn(data.unitSystem).toString(),
                          'unitLabel': data.unitSystem.unitLabel,
                        }
                      )),
                      subtitle: Text('historyItemSubtitle'.tr(
                        namedArgs: {
                          'time': DateFormat.jm().format(historyItem.createdAt),
                        },
                      )),
                      trailing: IconButton(
                        onPressed: () => ref.read(hydrationViewModelProvider.notifier).removeWater(historyItem.id, historyItem.amount.ml), 
                        icon: Icon(Icons.delete),
                      ),
                    ),
                  );
                },
                separatorBuilder: (_, _) => SizedBox(height: 6,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}