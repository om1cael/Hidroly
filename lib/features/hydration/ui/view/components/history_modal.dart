import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hidroly/features/hydration/ui/view/components/history_item_card.dart';
import 'package:hidroly/features/hydration/ui/view_model/hydration_view_model.dart';

class HistoryModal extends ConsumerStatefulWidget {
  const HistoryModal({super.key});

  @override
  ConsumerState<HistoryModal> createState() => _HistoryModalState();
}

class _HistoryModalState extends ConsumerState<HistoryModal> {
  final GlobalKey<AnimatedListState> _animatedListKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
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
            Text(
              'History',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            
            if (data.history.isNotEmpty) 
              Expanded(
                child: AnimatedList.separated(
                  key: _animatedListKey,
                  initialItemCount: data.history.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index, animation) {
                    final historyItem = data.history[index];

                    return HistoryItemCard(
                      historyItem: historyItem,
                      unitSystem: data.unitSystem,
                      animatedListKey: _animatedListKey,
                    );
                  },
                  separatorBuilder: (_, _, _) => SizedBox(height: 6,),
                  removedSeparatorBuilder: (_, _, _) => SizedBox(height: 6,), 
                ),
              ) else Expanded(
                child: Column(
                    mainAxisAlignment: .center,
                    crossAxisAlignment: .stretch,
                    spacing: 6,
                    children: [
                      Icon(Icons.air, size: 64,),
                      
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Column(
                          children: [
                            Text('emptyHistoryTitle'.tr(), style: Theme.of(context).textTheme.titleLarge,),
                            Text('emptyHistorySubtitle'.tr(), textAlign: .center,)
                          ],
                        ),
                      )
                    ],
                ),
              )
          ],
        ),
      ),
    );
  }
}