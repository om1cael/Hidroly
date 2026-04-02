import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hidroly/core/domain/enums/unit_systems.dart';
import 'package:hidroly/features/hydration/domain/entities/history_item.dart';
import 'package:hidroly/features/hydration/ui/extensions/unit_system_ui_extension.dart';
import 'package:hidroly/features/hydration/ui/view_model/hydration_view_model.dart';

class HistoryItemCard extends ConsumerWidget {
  const HistoryItemCard({
    super.key,
    required this.historyItem,
    required this.unitSystem,
    required this.animatedListKey,
  });

  final HistoryItem historyItem;
  final UnitSystem unitSystem;
  final GlobalKey<AnimatedListState> animatedListKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card.filled(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: ListTile(
        leading: CircleAvatar(
          child: Icon(Icons.water_drop),
        ),
        title: Text('historyItemTitle'.tr(
          namedArgs: {
            'amount': historyItem.amount.valueIn(unitSystem).toString(),
            'unitLabel': unitSystem.unitLabel,
          }
        )),
        subtitle: Text('historyItemSubtitle'.tr(
          namedArgs: {
            'time': DateFormat.jm().format(historyItem.createdAt),
          },
        )),
        trailing: IconButton(
          onPressed: () async {
            final historyList = ref.read(hydrationViewModelProvider).requireValue.history;
            final index = historyList.indexOf(historyItem);

            animatedListKey.currentState?.removeItem(
              index,
              (context, animation) {
                final offsetAnimation = animation.drive(
                  Tween<Offset>(
                    begin: const Offset(1, 0),
                    end: const Offset(0, 0),
                  ).chain(CurveTween(curve: Curves.easeOut)),
                );

                return SlideTransition(
                  position: offsetAnimation,
                  child: HistoryItemCard(
                    historyItem: historyItem, 
                    unitSystem: unitSystem, 
                    animatedListKey: animatedListKey
                  ),
                );
              }
            );

            await ref.read(hydrationViewModelProvider.notifier).removeWater(historyItem.id, historyItem.amount.ml);
          }, 
          icon: Icon(Icons.delete),
        ),
      ),
    );
  }
}