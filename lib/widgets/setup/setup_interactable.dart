import 'package:flutter/material.dart';
import 'package:hidroly/l10n/app_localizations.dart';
import 'package:hidroly/theme/app_colors.dart';
import 'package:hidroly/widgets/input/form_number_input_field.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SetupInteractable extends StatelessWidget {
  final TextEditingController ageController;
  final TextEditingController weightController;
  final ValueNotifier<bool> isMetric;

  const SetupInteractable({
    super.key,
    required this.ageController,
    required this.weightController,
    required this.isMetric,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        spacing: 10,
        children: [
          FormNumberInputField(
            controller: ageController, 
            label: AppLocalizations.of(context)!.setupAgeTextFieldLabel,
            validator: (value) {
              final age = int.tryParse(value ?? '');
              if(age == null || age < 10 || age > 120) return AppLocalizations.of(context)!.setupAgeTextFieldInvalidValue;
              return null;
            },
          ),
          FormNumberInputField(
            controller: weightController, 
            label: AppLocalizations.of(context)!.setupWeightTextFieldLabel,
            validator: (value) {
              final weight = int.tryParse(value ?? '');
              if(weight == null || weight < 30 || weight > 200) return AppLocalizations.of(context)!.setupWeightTextFieldInvalidValue;
              return null;
            },
          ),
          SizedBox(height: 5,),
          ToggleSwitch(
            initialLabelIndex: 0,
            totalSwitches: 2,
            activeBgColor: [AppColors.blueAccent],
            activeFgColor: AppColors.primaryText,
            inactiveBgColor: AppColors.onBackground,
            inactiveFgColor: AppColors.secondaryText,
            minWidth: 100,
            labels: [
              AppLocalizations.of(context)!.setupUnitMetric,
              AppLocalizations.of(context)!.setupUnitImperial,
            ],
            onToggle: (index) {
              isMetric.value = (index == 0);
            },
          )
        ],
      ),
    );
  }
}