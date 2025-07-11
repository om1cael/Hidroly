import 'package:flutter/material.dart';
import 'package:hidroly/provider/daily_history_provider.dart';
import 'package:hidroly/provider/day_provider.dart';
import 'package:hidroly/theme/app_colors.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DailyHistoryBottomSheet extends StatelessWidget {
  const DailyHistoryBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
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
                          color: AppColors.primaryText,
                        ),
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                      Text(
                        'Today\'s history',
                        style: TextStyle(
                          color: AppColors.primaryText
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
                            Text('No entries today.')
                          ],
                        ),
                      ),
                    ),
                  ] else ...[
                    Expanded(
                    child: ListView.builder(
                        controller: scrollController,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final history = historyList[index];
                          return Card(
                            color: AppColors.onBackground,
                            child: ListTile(
                              leading: Icon(
                                Icons.local_drink,
                                color: AppColors.blueAccent,
                              ),
                              title: Text(
                                '${history.amount}ml',
                                style: Theme.of(context).textTheme.bodyLarge
                              ),
                              subtitle: Text(
                                'Added ${DateFormat.Hm().format(history.dateTime.toLocal())}',
                                style: Theme.of(context).textTheme.bodySmall
                              ),
                              trailing: IconButton(
                                onPressed: () async {
                                  await context.read<DayProvider>()
                                    .removeWater(history.amount);
                                  
                                  if(!context.mounted) return;
                                  await context.read<DailyHistoryProvider>()
                                    .delete(history.id!, 1);
                                },
                                icon: Icon(
                                  Icons.delete_forever,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ),
                          );
                        }, 
                        itemCount: historyList.length
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