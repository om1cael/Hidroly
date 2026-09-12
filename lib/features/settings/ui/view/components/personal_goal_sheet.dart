import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hidroly/core/domain/hydration_constraints.dart';
import 'package:hidroly/core/ui/components/number_input_form_field.dart';
import 'package:hidroly/core/ui/extensions/unit_system_ui_extension.dart';
import 'package:hidroly/features/settings/ui/view_model/personal_goal_sheet_view_model.dart';

class PersonalGoalSheet extends ConsumerStatefulWidget {
  const PersonalGoalSheet({
    super.key,
  });

  @override
  ConsumerState<PersonalGoalSheet> createState() => _PersonalGoalSheetState();
}

class _PersonalGoalSheetState extends ConsumerState<PersonalGoalSheet> {
  final formKey = GlobalKey<FormState>();
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(personalGoalSheetViewModelProvider);

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          top: 20.0,
          left: 20.0,
          right: 20.0
        ),
        child: state.when(
          data: (data) => Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
                  suffix: data.unitSystem.unitLabel,
                  maxLength: 3,
                  validator: (value) {
                    final status = ref.read(personalGoalSheetViewModelProvider.notifier)
                      .validateGoal(value);
                    
                    switch(status) {
                      case .noInput:
                        return 'inputRequired'.tr(namedArgs: { 'requiredInput': 'goal'.tr().toLowerCase() });
                      case .outOfBoundaries:
                        return "inputRequirement".tr(namedArgs: { 'minValue': HydrationConstraints.minAllowedWaterMl.toString(), 'maxValue': HydrationConstraints.maxAllowedWaterMl.toString() });
                      default: return null;
                    }
                  }
                ),
          
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.tonal(
                    onPressed: () {
                      formKey.currentState!.validate();
                    }, 
                    child: const Text('Save')
                  ),
                ),
              ],
            ),
          ),
          loading: () => CircularProgressIndicator(),
          error: (_, _) => Text('errorOccurred'.tr()),
        ),
      ),
    );
  }
}