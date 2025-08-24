import 'package:flutter/material.dart';
import 'package:hidroly/data/model/history_entry.dart';
import 'package:hidroly/data/model/water_button.dart';
import 'package:hidroly/l10n/app_localizations.dart';
import 'package:hidroly/provider/custom_cups_provider.dart';
import 'package:hidroly/provider/daily_history_provider.dart';
import 'package:hidroly/provider/day_provider.dart';
import 'package:hidroly/utils/unit_tools.dart';
import 'package:hidroly/widgets/input/number_input_dialog.dart';
import 'package:provider/provider.dart';

class WaterActionButtons extends StatefulWidget {
  const WaterActionButtons({
    super.key,
    required this.dayId,
    required this.isMetric,
  });

  final int dayId;
  final bool isMetric;

  @override
  State<WaterActionButtons> createState() => _WaterActionButtonsState();
}

class _WaterActionButtonsState extends State<WaterActionButtons> {
  final TextEditingController updateDialogTextController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    updateDialogTextController.dispose();
    super.dispose();
  }

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
                          color: Theme.of(context).iconTheme.color
                        ),
                        Text(
                          AppLocalizations.of(context)!.editAction,
                          style: TextStyle(
                            color: Theme.of(context).textTheme.labelMedium!.color
                          )
                        ),
                      ],
                    ),
                    onTap: () async {
                      await showDialog(
                        context: context, 
                        builder: (context) {
                          return Form(
                            key: formKey,
                            child: NumberInputDialog(
                              title: AppLocalizations.of(context)!.editCustomCupDialogTitle, 
                              inputFieldLabel: AppLocalizations.of(context)!.customCupDialogTextFieldAmount, 
                              actionButtonText: AppLocalizations.of(context)!.updateAction, 
                              cancelButtonText: AppLocalizations.of(context)!.cancelAction, 
                              inputFieldValidator: (value) {
                                double? amount = double.tryParse(value ?? '');
                                if(amount == null || amount <= 0) return AppLocalizations.of(context)!.textFieldAmountError;
                                return null;
                              },
                              onActionPressed: () async {
                                if(!formKey.currentState!.validate()) return;

                                double amount = double.parse(updateDialogTextController.text);
                                int metricAmount = widget.isMetric 
                                  ? amount.round()
                                  : UnitTools.flOzToMl(amount);
                                
                                WaterButton updatedCup = cup.copyWith(amount: metricAmount);
                                bool success = await context.read<CustomCupsProvider>()
                                  .updateCustomCup(updatedCup);

                                if(!context.mounted) return;

                                String message = success
                                  ? AppLocalizations.of(context)!.editCustomCupSuccess
                                  : AppLocalizations.of(context)!.editCustomCupFailed;
                                
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text(message)
                                  )
                                );

                                Navigator.of(context).pop();
                                updateDialogTextController.clear();
                              },
                              onCancelPressed: () {
                                Navigator.of(context).pop();
                                updateDialogTextController.clear();
                              }, 
                              textEditingController: updateDialogTextController,
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
                          AppLocalizations.of(context)!.deleteAction,
                          style: TextStyle(
                            color: Colors.redAccent
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
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(12)
              ),
              avatar: Icon(Icons.water_drop),
              backgroundColor: Theme.of(context).colorScheme.onSurface,
              label: Text(
                UnitTools.getVolumeWithUnit(cup.amount, widget.isMetric, context: context),
                style: Theme.of(context).textTheme.labelLarge
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
        dayId: widget.dayId, 
        amount: amount, 
        dateTime: DateTime.now().toUtc()
      )
    );
  }
}