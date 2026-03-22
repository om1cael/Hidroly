import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hidroly/core/domain/enums/unit_systems.dart';
import 'package:hidroly/core/ui/components/number_input_form_field.dart';
import 'package:hidroly/features/hydration/domain/value_objects/cup_value.dart';
import 'package:hidroly/features/hydration/ui/extensions/unit_system_ui_extension.dart';

class CupCreationForm extends StatelessWidget {
  const CupCreationForm({
    super.key,
    required this.controller,
    required this.formKey,
    required this.unitSystem,
    required this.validator,
    required this.onCreatePressed,
  });

  final TextEditingController controller;
  final GlobalKey<FormState> formKey;

  final UnitSystem unitSystem;

  final VoidCallback onCreatePressed;
  final String? Function(String?) validator;

  List<int> get _presets => unitSystem == .metric
    ? [200, 350, 500]
    : [8, 12, 16];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('cupCreationTitle'.tr(), style: Theme.of(context).textTheme.titleLarge),
      
          const SizedBox(height: 16),
      
          NumberInputFormField(
            controller: controller, 
            label: '', 
            maxLength: 4,
            hintText: 'cupInputHint'.tr(namedArgs: {'amount': CupValue.maxValueFor(unitSystem).toString()}),
            suffix: unitSystem.unitLabel, 
            validator: validator,
            autoFocus: true,
          ),
      
          const SizedBox(height: 16),
      
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _presets.map((value) => ActionChip(
              label: Text('$value ${unitSystem.unitLabel}'),
              onPressed: () => controller.text = value.toString(),
            )).toList(),
          ),
          
          const SizedBox(height: 24),
      
          SizedBox(
            width: double.infinity,
            child: FilledButton.tonal(
              onPressed: onCreatePressed,
              child: Text('create'.tr()),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}