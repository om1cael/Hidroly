import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hidroly/features/setup/domain/setup_constraints.dart';
import 'package:hidroly/features/setup/domain/setup_stage.dart';
import 'package:hidroly/features/setup/domain/unit_systems.dart';
import 'package:hidroly/features/setup/domain/value_objects/age.dart';
import 'package:hidroly/features/setup/domain/value_objects/weight.dart';
import 'package:hidroly/features/setup/ui/view/widgets/header_text.dart';
import 'package:hidroly/features/setup/ui/view/widgets/number_input_form_field.dart';
import 'package:hidroly/features/setup/ui/view_model/setup_view_model.dart';

class SetupView extends ConsumerStatefulWidget {
  const SetupView({super.key});

  @override
  ConsumerState<SetupView> createState() => _SetupViewState();
}

class _SetupViewState extends ConsumerState<SetupView> {
  final ageTextController = TextEditingController();
  final weightTextController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();

    ageTextController.dispose();
    weightTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final setupState = ref.watch(setupViewModelProvider);
    final unitSystem = setupState.unit.first;

    ref.listen(setupViewModelProvider, (previous, newState) async {
      if((previous == null || previous.setupStage != .success) && newState.setupStage == .success) {
        if(newState.dailyGoalClamped) {
          showDialog(
            context: context, 
            builder: (context) {
              return AlertDialog(
                title: Text('About your daily goal'),
                content: Text(
                  'We\'ve set your daily goal to a maximum of ${_getWaterSuggestionUnitText(setupState.unit.first)} to keep things within our recommended range. For personalized advice, feel free to consult a healthcare professional.'
                ),
                actions: [
                  TextButton(
                    onPressed: () {},
                    child: Text('I understand')
                  ),
                ],
              );
            }
          ).then((_) {
            // TODO: go to home page
          });
        }
      } else if(newState.setupStage == SetupStage.error) {
        showDialog(
          context: context, 
          builder: (context) {
            return AlertDialog(
              title: Text('An error occurred'),
              content: Text('Oops. An error occurred while saving your informations.'),
              actions: [
                TextButton(
                  onPressed: Navigator.of(context).pop, 
                  child: Text('Ok'),
                ),
              ],
            );
          }
        );
      }
    });

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
                    key: formKey,
                    child: Column(
                      spacing: 24,
                      children: [
                        NumberInputFormField(
                          controller: ageTextController,
                          label: 'Age',
                          maxLength: 3,
                          validator: (value) {
                            final minAge = Age.minAge;
                            final maxAge = Age.maxAge;

                            final validationResult = ref.read(setupViewModelProvider.notifier)
                              .validateAge(value);
                            
                            switch(validationResult) {
                              case .noInput:
                                return 'You must input your age';
                              case .outOfBoundaries:
                                return 'You must be between $minAge and $maxAge years old';
                              default: return null;
                            }
                          },
                        ),
                        NumberInputFormField(
                          controller: weightTextController,
                          label: 'Weight',
                          suffix: unitSystem == UnitSystem.metric
                            ? 'kg'
                            : 'lbs',
                          maxLength: 3,
                          validator: (value) {
                            final minWeight = Weight.minWeight;
                            final maxWeight = Weight.maxWeight;

                            final validationResult = ref.read(setupViewModelProvider.notifier)
                              .validateWeight(value);
                            
                            switch(validationResult) {
                              case .noInput:
                                return 'You must input your weight';
                              case .outOfBoundaries:
                                return 'You must weight between $minWeight and $maxWeight';
                              default: return null;
                            }
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
        onPressed: (setupState.setupStage != .idle)
          ? null
          : () {
              if(formKey.currentState == null || !formKey.currentState!.validate()) {
                return;
              }

              ref
                .read(setupViewModelProvider.notifier)
                .completeSetup(ageTextController.text, weightTextController.text);
          },
        child: setupState.setupStage == .success
          ? Icon(Icons.check)
          : setupState.setupStage == .processing
            ? Transform.scale(
              scale: .8,
              child: CircularProgressIndicator()
            )
            : Icon(Icons.navigate_next),
      ),
    );
  }

  String _getWaterSuggestionUnitText(UnitSystem unit) {
    return unit == UnitSystem.metric
      ? '${SetupConstraints.maxWaterSuggestionMl} ml'
      : '${SetupConstraints.maxWaterSuggestionOz} oz';
  }
}