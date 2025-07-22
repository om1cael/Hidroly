import 'package:flutter/material.dart';
import 'package:hidroly/data/model/history_entry.dart';
import 'package:hidroly/data/model/water_button.dart';
import 'package:hidroly/l10n/app_localizations.dart';
import 'package:hidroly/provider/custom_cups_provider.dart';
import 'package:hidroly/provider/daily_history_provider.dart';
import 'package:hidroly/provider/day_provider.dart';
import 'package:hidroly/theme/app_colors.dart';
import 'package:hidroly/utils/unit_tools.dart';
import 'package:hidroly/widgets/input/form_number_input_field.dart';
import 'package:provider/provider.dart';

class WaterActionButtons extends StatelessWidget {
  final TextEditingController customCupAmountController;
  final GlobalKey<FormState> formKey;
  final int dayId;

  final bool isMetric;

  final _defaultButtons = [WaterButton(amount: 250), WaterButton(amount: 350)];
  final _addCustomCupButton = WaterButton(amount: 0, isCustomOption: true);

  WaterActionButtons({
    super.key,
    required this.dayId,
    required this.customCupAmountController,
    required this.formKey,
    required this.isMetric,
  });

  @override
  Widget build(BuildContext context) {
    final List<WaterButton> customCups = 
      context.watch<CustomCupsProvider>().customCups;
    
    List<WaterButton> allButtons = [
      ..._defaultButtons,
      ...customCups,
      _addCustomCupButton,
    ];

    return Container(
      height: 45,
      margin: EdgeInsets.only(left: 15, right: 15),
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var button = allButtons[index];

          return ElevatedButton.icon(
            onPressed: () async {
              if(button.isCustomOption) {
                _showCustomCupPopUp(context);
                return;
              }

              final success = await context
                  .read<DayProvider>()
                  .addWater(button.amount);
              
              if(!success && context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(AppLocalizations.of(context)!.waterAddFailed)
                  )
                );
                
                return;
              }

              if(!context.mounted) return;
              await context.read<DailyHistoryProvider>().create(
                HistoryEntry(
                  dayId: dayId, 
                  amount: button.amount, 
                  dateTime: DateTime.now().toUtc()
                )
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff31333A),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(16)
              ),
            ),
            icon: Icon(
              button.isCustomOption == false 
              ? Icons.ac_unit : Icons.add,
            ),
            label: Text(
              button.isCustomOption == false 
                ? UnitTools.getVolumeWithUnit(button.amount, isMetric, context: context) 
                : AppLocalizations.of(context)!.customCupButton,
              style: TextStyle(
                color: AppColors.secondaryText
              ),
            ),
          );
        }, 
        separatorBuilder: (context, index) => SizedBox(width: 10,), 
        itemCount: allButtons.length
      ),
    );
  }

  void _showCustomCupPopUp(context) {
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        title: Text(
          AppLocalizations.of(context)!.customCupDialogTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        content: Form(
          key: formKey,
          child: FormNumberInputField(
            label: AppLocalizations.of(context)!.customCupDialogTextFieldAmount, 
            decimal: !isMetric,
            maxLength: 4,
            controller: customCupAmountController, 
            validator: (value) {
              double? amount = double.tryParse(value ?? '');
              if(amount == null || amount <= 0) return AppLocalizations.of(context)!.textFieldAmountError;
              return null;
            }
          ),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              if(!formKey.currentState!.validate()) return;
              
              double? amount = double.tryParse(customCupAmountController.text);
              if(amount == null) return;

              bool created = await context.read<CustomCupsProvider>().createCustomCup(
                isMetric ? amount.round() : UnitTools.flOzToMl(amount)
              );

              if(created && context.mounted) {
                Navigator.of(context).pop();
                customCupAmountController.clear();
              }
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
      )
    );
  }
}