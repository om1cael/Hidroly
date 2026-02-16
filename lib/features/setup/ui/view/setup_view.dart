import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hidroly/features/setup/domain/setup_constraints.dart';
import 'package:hidroly/features/setup/domain/unit_systems.dart';
import 'package:hidroly/features/setup/ui/state/setup_state.dart';
import 'package:hidroly/features/setup/ui/view/widgets/header_text.dart';
import 'package:hidroly/features/setup/ui/view/widgets/number_input_form_field.dart';
import 'package:hidroly/features/setup/ui/view_model/setup_view_model.dart';

class SetupView extends ConsumerWidget {
  const SetupView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final setupState = ref.watch(setupViewModelProvider);
    final unitSystem = setupState.unit.first;

    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.all(48.0),
        child: CustomScrollView(
          physics: ClampingScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                spacing: 64,
                crossAxisAlignment: .center,
                children: [
                  const Spacer(flex: 2,),

                  HeaderText(
                    title: 'Welcome',
                    subtitle: 'Let\'s set up your profile to personalize your daily water goal.',
                  ),

                  Form(
                    child: Column(
                      spacing: 24,
                      children: [
                        NumberInputFormField(
                          label: 'Age',
                          maxLength: 3,
                          validator: (value) {
                            final minAge = SetupConstraints.minAge;
                            final maxAge = SetupConstraints.maxAge;

                            return ref
                              .read(setupViewModelProvider.notifier)
                              .validateAge(value, 'You must be between $minAge and $maxAge years old.');
                          },
                        ),
                        NumberInputFormField(
                          label: 'Weight',
                          suffix: unitSystem == UnitSystem.metric
                            ? 'kg'
                            : 'lbs',
                          maxLength: 3,
                          validator: (value) {
                            final minWeight = setupState.minWeight;
                            final maxWeight = setupState.maxWeight;

                            return ref
                              .read(setupViewModelProvider.notifier)
                              .validateWeight(value, 'Weight must be between $minWeight and $maxWeight.');
                          },
                        ),
                        SegmentedButton(
                          segments: [
                            ButtonSegment(
                              label: Text('kg, ml'),
                              value: UnitSystem.metric
                            ),
                            ButtonSegment(
                              label: Text('lb, oz'),
                              value: UnitSystem.imperial
                            ),
                          ], 
                          selected: setupState.unit,
                          onSelectionChanged: (newSelection) {
                            ref
                              .read(setupViewModelProvider.notifier)
                              .setUnitSystem(newSelection.first);
                          },
                        ),
                      ],
                    )
                  ),

                  Text('Your data never leaves your device.'),

                  const Spacer(),
                ],
              ),
            )
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}