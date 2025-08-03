import 'package:flutter/material.dart';
import 'package:hidroly/data/model/history_entry.dart';
import 'package:hidroly/data/model/water_button.dart';
import 'package:hidroly/l10n/app_localizations.dart';
import 'package:hidroly/provider/custom_cups_provider.dart';
import 'package:hidroly/provider/daily_history_provider.dart';
import 'package:hidroly/provider/day_provider.dart';
import 'package:hidroly/theme/app_colors.dart';
import 'package:hidroly/utils/unit_tools.dart';
import 'package:hidroly/widgets/input/number_input_dialog.dart';
import 'package:provider/provider.dart';

class WaterActionButtons extends StatelessWidget {
  const WaterActionButtons({
    super.key,
    required this.dayId,
    required this.isMetric,
  });

  final int dayId;
  final bool isMetric;

  @override
  Widget build(BuildContext context) {
    final List<WaterButton> customCups = 
      context.watch<CustomCupsProvider>().customCups;

    return Container(
      height: 45,
      margin: EdgeInsets.only(left: 15, right: 15),
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var cup = customCups[index];

          return GestureDetector(
            onLongPressStart: (details) async {
              final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
              final Offset tapPosition = details.globalPosition;

              await showMenu(
                context: context, 
                items: <PopupMenuEntry<String>>[
                  PopupMenuItem(
                    child: Row(
                      spacing: 12,
                      children: [
                        Icon(
                          Icons.edit,
                          color: AppColors.primaryText,
                        ),
                        Text(
                          'Edit',
                          style: TextStyle(
                            color: AppColors.secondaryText
                          )
                        ),
                      ],
                    ),
                    onTap: () async {
                      await showDialog(
                        context: context, 
                        builder: (context) {
                          return Form(
                            // TODO: Use localized messages
                            child: NumberInputDialog(
                              title: 'Edit custom cup', 
                              inputFieldLabel: 'Amount', 
                              actionButtonText: 'Update', 
                              cancelButtonText: 'Cancel', 
                              inputFieldValidator: (value) {
                                double? amount = double.tryParse(value ?? '');
                                if(amount == null || amount <= 0) return AppLocalizations.of(context)!.textFieldAmountError;
                                return null;
                              },
                              onActionPressed: () {
                                // TODO: Update custom cup
                              },
                              onCancelPressed: () {
                                Navigator.of(context).pop();
                              }, 
                              textEditingController: TextEditingController(),
                            ),
                          );
                        }
                      );
                    },
                  ),
                  PopupMenuItem(
                    child: Row(
                      spacing: 12,
                      children: [
                        Icon(
                          Icons.delete_forever,
                          color: Colors.redAccent,
                        ),
                        Text(
                          'Delete',
                          style: TextStyle(
                            color: AppColors.secondaryText
                          ),
                        ),
                      ],
                    ),
                    onTap: () async {
                      await context.read<CustomCupsProvider>()
                        .deleteCustomCup(cup.id!);
                    },
                  ),
                ],
                color: Theme.of(context).colorScheme.onSurface,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(12)
                ),
                position: RelativeRect.fromRect(
                  tapPosition & Size(40, 40), // Size of the menu
                  Offset.zero & overlay.size,
                ),
              );
            },
            child: ActionChip(
              onPressed: () async {
                final int amount = cup.amount;
                await addWater(context, amount);
            
                if(!context.mounted) return;
                await saveWaterToHistory(context, amount);
              },
              avatar: Icon(Icons.water_drop),
              backgroundColor: Theme.of(context).colorScheme.onSurface,
              label: Text(
                UnitTools.getVolumeWithUnit(cup.amount, isMetric, context: context),
                style: TextStyle(
                  color: AppColors.secondaryText
                ),
              ),
            ),
          );
        }, 
        separatorBuilder: (context, index) => SizedBox(width: 10,), 
        itemCount: customCups.length
      ),
    );
  }

  Future<bool> addWater(BuildContext context, int amount) async {
    final success = await context
        .read<DayProvider>()
        .addWater(amount);
    
    if(!success && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.waterAddFailed)
        )
      );
    }

    return success;
  }

  Future<void> saveWaterToHistory(BuildContext context, int amount) async {
    await context.read<DailyHistoryProvider>().create(
      HistoryEntry(
        dayId: dayId, 
        amount: amount, 
        dateTime: DateTime.now().toUtc()
      )
    );
  }
}