import 'package:flutter/material.dart';
import 'package:hidroly/data/model/history_entry.dart';
import 'package:hidroly/l10n/app_localizations.dart';
import 'package:hidroly/provider/app_state_provider.dart';
import 'package:hidroly/provider/custom_cups_provider.dart';
import 'package:hidroly/provider/daily_history_provider.dart';
import 'package:hidroly/provider/day_provider.dart';
import 'package:hidroly/utils/unit_tools.dart';
import 'package:hidroly/widgets/input/form_number_input_field.dart';
import 'package:provider/provider.dart';

class FabHome extends StatefulWidget {
  const FabHome({
    super.key,
    required this.dayId,
    required this.isMetric,
  });

  final int dayId;
  final bool isMetric;

  @override
  State<FabHome> createState() => _FabHomeState();
}

class _FabHomeState extends State<FabHome> {
  final TextEditingController customCupAmountController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    customCupAmountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final editMode =
      context.watch<AppStateProvider>().editMode;

    return FloatingActionButton(
      onPressed: () => editMode
        ? _toggleEditMode(editMode)
        : _showCustomCupPopUp(context),
      child: editMode 
        ? Icon(Icons.done)
        : Icon(Icons.add)
    );
  }

  void _showCustomCupPopUp(BuildContext context) {
    showDialog(
      context: context, 
      builder: (context) {
        bool doNotSaveCup = true;

        return AlertDialog(
          title: Text(
            AppLocalizations.of(context)!.customCupDialogTitle,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          content: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                FormNumberInputField(
                  label: AppLocalizations.of(context)!.customCupDialogTextFieldAmount, 
                  decimal: !widget.isMetric,
                  maxLength: 4,
                  controller: customCupAmountController, 
                  validator: (value) {
                    double? amount = double.tryParse(value ?? '');
                    if(amount == null || amount <= 0) return AppLocalizations.of(context)!.textFieldAmountError;
                    return null;
                  }
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    StatefulBuilder(
                      builder: (context, setState) {
                        return Checkbox(
                          value: doNotSaveCup, 
                          onChanged: (value) {
                            setState(() => doNotSaveCup = value!);
                          }
                        );
                      }
                    ),
                    Text(
                      AppLocalizations.of(context)!.doNotSaveLabel,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () async {
                if(!formKey.currentState!.validate()) return;
                bool success = false;
                
                double? amount = double.tryParse(customCupAmountController.text);
                if(amount == null) return;

                if(doNotSaveCup) {
                  int formattedAmount = 
                    widget.isMetric ? amount.round() : UnitTools.flOzToMl(amount);
                  
                  success = await context
                    .read<DayProvider>()
                    .addWater(formattedAmount);

                  if(!context.mounted) return;
                  await context.read<DailyHistoryProvider>().create(
                    HistoryEntry(
                      dayId: widget.dayId, 
                      amount: formattedAmount, 
                      dateTime: DateTime.now().toUtc()
                    )
                  );
                } else {
                  success = await context.read<CustomCupsProvider>().createCustomCup(
                    widget.isMetric ? amount.round() : UnitTools.flOzToMl(amount)
                  );
                }

                if(!context.mounted) return;
                if(!success) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(AppLocalizations.of(context)!.waterAddFailed)
                    )
                  );
                }

                Navigator.of(context).pop();
                customCupAmountController.clear();
              }, 
              child: Text(
                AppLocalizations.of(context)!.addAction,
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context), 
              child: Text(
                AppLocalizations.of(context)!.cancelAction,
              ),
            ),
          ],
          backgroundColor: Theme.of(context).colorScheme.surface,
        );
      }
    );
  }

  void _toggleEditMode(bool editMode) {
    context.read<AppStateProvider>().editMode = !editMode;
  }
}