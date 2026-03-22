import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hidroly/core/ui/components/number_input_form_field.dart';

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

  final String unitSystem;

  final VoidCallback onCreatePressed;
  final String? Function(String?) validator;

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
            maxLength: 3,
            hintText: 'e.g. 200',
            suffix: unitSystem, 
            validator: validator,
            autoFocus: true,
          ),
      
          const SizedBox(height: 16),
      
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [100, 200, 300].map((ml) => ActionChip(
              label: Text('$ml ml'),
              onPressed: () => controller.text = ml.toString(),
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