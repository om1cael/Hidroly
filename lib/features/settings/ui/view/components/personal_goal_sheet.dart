import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hidroly/core/domain/hydration_constraints.dart';
import 'package:hidroly/core/domain/value_objects/goal.dart';
import 'package:hidroly/core/ui/components/number_input_form_field.dart';
import 'package:hidroly/core/ui/extensions/snack_bar_extension.dart';
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

    ref.listen(personalGoalSheetViewModelProvider, (previous, next) {
      if(previous == null || previous.value == null || next.value == null) return;

      if(!previous.value!.goalOutsideBoundaries && next.value!.goalOutsideBoundaries) {
        showDialog(
          context: context, 
          builder: (_) {
            return AlertDialog(
              title: Text('important'.tr()),
              content: Text('goalTargetAboveLimit'.tr()),
              actions: [
                TextButton(
                  onPressed: Navigator.of(context).pop, 
                  child: Text('ok'.tr())
                ),
              ],
            );
          }
        );
      }
    });

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
                      'personalGoal'.tr(),
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      'personalGoalExplain'.tr(),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
          
                NumberInputFormField(
                  controller: textController, 
                  label: 'goal'.tr(), 
                  suffix: data.unitSystem.unitLabel,
                  maxLength: 4,
                  validator: (value) {
                    final status = ref.read(personalGoalSheetViewModelProvider.notifier)
                      .validateGoal(value);
                    
                    switch(status) {
                      case .noInput:
                        return 'inputRequired'.tr(namedArgs: { 'requiredInput': 'goal'.tr().toLowerCase() });
                      case .outOfBoundaries:
                        return "inputRequirement".tr(namedArgs: { 'minValue': Goal.minValueFor(state.requireValue.unitSystem).toString(), 'maxValue': Goal.maxValueFor(state.requireValue.unitSystem).toString() });
                      default: return null;
                    }
                  }
                ),
          
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.tonal(
                    onPressed: () async {
                      final valid = formKey.currentState!.validate();
                      if(!valid) return;

                      Navigator.of(context).pop();

                      final goal = int.parse(textController.text);
                      await ref.read(personalGoalSheetViewModelProvider.notifier)
                        .save(goal);
                      
                      if(!context.mounted) return;
                      context.showSnackBar("goalSaved".tr());
                    }, 
                    child: Text('save'.tr())
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