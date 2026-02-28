import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hidroly/core/domain/enums/unit_systems.dart';
import 'package:hidroly/core/domain/value_objects/age.dart';
import 'package:hidroly/core/domain/value_objects/weight.dart';
import 'package:hidroly/core/ui/view_model/hydration_form_view_model.dart';
import 'package:hidroly/features/setup/ui/view/widgets/number_input_form_field.dart';

class HydrationFormView extends ConsumerWidget {
  const HydrationFormView({
    super.key, 
    required this.formKey,
    required this.ageTextController,
    required this.weightTextController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController ageTextController;
  final TextEditingController weightTextController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unitSystem = ref.watch(hydrationFormViewModelProvider).unit;

    return Form(
      key: formKey,
      child: Column(
        spacing: 24,
        children: [
          NumberInputFormField(
            controller: ageTextController,
            label: 'age'.tr(),
            maxLength: 3,
            validator: (value) {
              final minAge = Age.minAge;
              final maxAge = Age.maxAge;

              final validationResult = ref.read(hydrationFormViewModelProvider.notifier)
                .validateAge(value);
              
              switch(validationResult) {
                case .noInput:
                  return 'inputRequired'.tr(namedArgs: {'requiredInput': 'age'.tr().toLowerCase()});
                case .outOfBoundaries:
                  return 'ageInputRequirement'.tr(
                    namedArgs: {'minAge': minAge.toString(), 'maxAge': maxAge.toString()},
                  );
                default: return null;
              }
            },
          ),
          NumberInputFormField(
            controller: weightTextController,
            label: 'weight'.tr(),
            suffix: unitSystem.first == UnitSystem.metric
              ? 'kg'.tr()
              : 'lb'.tr(),
            maxLength: 3,
            validator: (value) {
              final minWeight = Weight.minWeightFor(unitSystem.first);
              final maxWeight = Weight.maxWeightFor(unitSystem.first);

              final validationResult = ref.read(hydrationFormViewModelProvider.notifier)
                .validateWeight(value);
              
              switch(validationResult) {
                case .noInput:
                  return 'inputRequired'.tr(namedArgs: {'requiredInput': 'weight'.tr().toLowerCase()});
                case .outOfBoundaries:
                  return 'weightInputRequirement'.tr(
                    namedArgs: {'minWeight': minWeight.toString(), 'maxWeight': maxWeight.toString()},
                  );
                default: return null;
              }
            },
          ),
          SegmentedButton(
            segments: [
              ButtonSegment(
                label: Text('${'kg'.tr()}, ${'ml'.tr()}'),
                value: UnitSystem.metric
              ),
              ButtonSegment(
                label: Text('${'lb'.tr()}, ${'oz'.tr()}'),
                value: UnitSystem.imperial
              ),
            ], 
            selected: unitSystem,
            onSelectionChanged: (newSelection) {
              ref
                .read(hydrationFormViewModelProvider.notifier)
                .setUnitSystem(newSelection.first);
            },
          ),
        ],
      )
    );
  }
}