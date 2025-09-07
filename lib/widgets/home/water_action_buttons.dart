import 'package:flutter/material.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:hidroly/data/services/haptic_feedback/haptic_feedback_service.dart';
import 'package:hidroly/domain/models/history_entry.dart';
import 'package:hidroly/domain/models/water_button.dart';
import 'package:hidroly/l10n/app_localizations.dart';
import 'package:hidroly/provider/app_state_provider.dart';
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
    
    final editMode =
      context.watch<AppStateProvider>().editMode;

    customCups.sort((a, b) => a.position!.compareTo(b.position!));

    return Container(
      height: 45,
      margin: EdgeInsets.only(left: 15, right: 15),
      child: ReorderableListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        proxyDecorator: proxyDecorator,
        onReorder: (oldPos, newPos) {
          if(oldPos < newPos) {
            newPos -= 1;
          }

          context.read<CustomCupsProvider>()
            .reorderCups(oldPos, newPos);
        },
        itemBuilder: (context, index) {
          var cup = customCups[index];

          return Row(
            key: Key(cup.id.toString()),
            children: [
              GestureDetector(
                onLongPressStart: !editMode
                  ? (details) async {
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
                                Icons.swap_horiz,
                                color: Theme.of(context).iconTheme.color,
                              ),
                              Text(
                                AppLocalizations.of(context)!.rearrangeAction,
                                style: TextStyle(
                                  color: Theme.of(context).textTheme.labelMedium!.color
                                ),
                              ),
                            ],
                          ),
                          onTap: () async {
                            context.read<AppStateProvider>().editMode = true;
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

                            if(!context.mounted) return;
                            await HapticFeedbackService(
                              context: context,
                            ).vibrate(HapticsType.success);
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
                }
                : null,
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
              ),

              if(index < customCups.length - 1)
                SizedBox(width: 8,),
            ],
          );
        },
        itemCount: customCups.length
      ),
    );
  }

  Widget proxyDecorator(Widget child, int index, Animation<double> animation) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        return Material(
          elevation: 0,
          color: Colors.transparent,
          child: child,
        );
      },
      child: child,
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

    if(!context.mounted) return false;
    await HapticFeedbackService(
      context: context,
    ).vibrate(HapticsType.success);

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