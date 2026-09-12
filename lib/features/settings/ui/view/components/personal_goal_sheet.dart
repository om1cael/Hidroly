import 'package:flutter/material.dart';
import 'package:hidroly/core/ui/components/number_input_form_field.dart';

class PersonalGoalSheet extends StatefulWidget {
  const PersonalGoalSheet({
    super.key,
  });

  @override
  State<PersonalGoalSheet> createState() => _PersonalGoalSheetState();
}

class _PersonalGoalSheetState extends State<PersonalGoalSheet> {
  final formKey = GlobalKey<FormState>();
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          top: 20.0,
          left: 20.0,
          right: 20.0
        ),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: .min,
            spacing: 30.0,
            children: [
              Column(
                children: [
                  Text(
                    'Personal Goal',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    'This goal will be used for every day from now on.',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),

              NumberInputFormField(
                controller: textController, 
                label: 'Goal', 
                maxLength: 3,
                validator: (value) {
                  return;
                }
              ),

              SizedBox(
                width: double.infinity,
                child: FilledButton.tonal(
                  onPressed: () => {}, 
                  child: Text('Save')
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}