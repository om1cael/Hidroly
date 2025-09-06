import 'package:flutter/material.dart';
import 'package:hidroly/domain/models/history_entry.dart';
import 'package:hidroly/l10n/app_localizations.dart';
import 'package:hidroly/provider/daily_history_provider.dart';
import 'package:hidroly/provider/day_provider.dart';
import 'package:hidroly/ui/core/theme/app_colors.dart';
import 'package:hidroly/utils/unit_tools.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DailyHistoryBottomSheet extends StatelessWidget {
  final int dayId;
  final bool isMetric;

  const DailyHistoryBottomSheet({
    super.key,
    required this.dayId,
    required this.isMetric,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 1,
      builder: (context, scrollController) { 
        return Consumer<DailyHistoryProvider>(
          builder: (context, provider, _) {
            final historyList = provider.history;
    
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(), 
                        icon: Icon(
                          Icons.arrow_back,
                          color: Theme.of(context).iconTheme.color,
                        ),
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                      Text(
                        AppLocalizations.of(context)!.dayHistoryBottomSheetTitle,
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyLarge!.color
                        ),
                      )
                    ],
                  ),
                  
                  if(historyList.isEmpty)...[
                    Expanded(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children:[ 
                            Icon(
                              Icons.air,
                              color: AppColors.secondaryText,
                              size: 48,
                            ),
                            Text(AppLocalizations.of(context)!.dayHistoryBottomSheetNoItems)
                          ],
                        ),
                      ),
                    ),
                  ] else ...[
                    Expanded(
                      child: AnimatedList(
                        controller: scrollController,
                        itemBuilder: (context, index, animation) {
                          final history = historyList[index];
                          return HistoryItem(
                            history: history, 
                            isMetric: isMetric,
                            onRemove: () async {
                              AnimatedList.of(context).removeItem(
                                index, 
                                (_, animation) {
                                  return SlideTransition(
                                    position: animation.drive(
                                      Tween<Offset>(
                                        begin: Offset(1, 0),
                                        end: Offset.zero,
                                      ).chain(CurveTween(curve: Curves.easeOut)),
                                    ),
                                    child: FadeTransition(
                                      opacity: animation,
                                      child: HistoryItem(
                                        history: history, 
                                        isMetric: isMetric, 
                                        onRemove: () {},
                                      ),
                                    ),
                                  );
                                }
                              );

                              await context.read<DayProvider>()
                                .removeWater(history.amount);
                              
                              if(!context.mounted) return;
                              await context.read<DailyHistoryProvider>()
                                .delete(
                                  history.id!, 
                                  dayId
                                );
                            },
                          );
                        }, 
                        initialItemCount: historyList.length
                      ),
                    ),
                  ]
                ]
              ),
            );
          }
        );
      }
    );
  }
}

class HistoryItem extends StatelessWidget {
  const HistoryItem({
    super.key,
    required this.history,
    required this.isMetric,
    required this.onRemove,
  });

  final HistoryEntry history;
  final bool isMetric;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.onSurface,
      child: ListTile(
        leading: Icon(
          Icons.local_drink,
          color: Theme.of(context).primaryColor
        ),
        title: Text(
          UnitTools.getVolumeWithUnit(history.amount, isMetric, context: context),
          style: Theme.of(context).textTheme.bodyLarge
        ),
        subtitle: Text(
          AppLocalizations.of(context)!
            .dayHistoryBottomSheetItemSubtitle(
              DateFormat.Hm().format(history.dateTime.toLocal())
            ),
          style: Theme.of(context).textTheme.bodySmall
        ),
        trailing: IconButton(
          onPressed: onRemove,
          icon: Icon(
            Icons.delete_forever,
            color: Colors.redAccent,
          ),
        ),
      ),
    );
  }
}