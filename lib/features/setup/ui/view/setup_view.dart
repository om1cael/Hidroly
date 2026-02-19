import 'package:easy_localization/easy_localization.dart';
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
                title: Text('dailyGoalDisclaimerTitle'.tr()),
                content: Text(
                  'dailyGoalDisclaimerContent'.tr(
                    namedArgs: {'suggestedAmount': _getWaterSuggestionUnitText(setupState.unit.first)}
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('understand'.tr())
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
              title: Text('errorOccurred'.tr()),
              content: Text('setupError'.tr()),
              actions: [
                TextButton(
                  onPressed: Navigator.of(context).pop, 
                  child: Text('ok'.tr()),
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
                    title: 'welcome'.tr(),
                    subtitle: 'setupSubtitle'.tr(),
                  ),

                  Form(
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

                            final validationResult = ref.read(setupViewModelProvider.notifier)
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
                          suffix: unitSystem == UnitSystem.metric
                            ? 'kg'.tr()
                            : 'lb'.tr(),
                          maxLength: 3,
                          validator: (value) {
                            final minWeight = Weight.minWeight;
                            final maxWeight = Weight.maxWeight;

                            final validationResult = ref.read(setupViewModelProvider.notifier)
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

                  Text('dataPrivacy'.tr()),

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
      ? '${SetupConstraints.maxWaterSuggestionMl} ${'ml'.tr()}'
      : '${SetupConstraints.maxWaterSuggestionOz} ${'oz'.tr()}';
  }
}