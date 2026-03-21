import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hidroly/core/ui/view/hydration_form_view.dart';
import 'package:hidroly/core/ui/view_model/hydration_form_view_model.dart';
import 'package:hidroly/core/domain/hydration_constraints.dart';
import 'package:hidroly/core/domain/enums/unit_systems.dart';
import 'package:hidroly/features/setup/ui/view/widgets/header_text.dart';
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
    final state = ref.watch(setupViewModelProvider);
    final unitSystem = ref.watch(hydrationFormViewModelProvider).unit;

    ref.listen(setupViewModelProvider, (previous, newState) async {
      if((previous == null || previous.stage != .success) && newState.stage == .success) {
        if(newState.dailyGoalClamped) {
          await showDialog(
            context: context, 
            builder: (context) {
              return AlertDialog(
                title: Text('dailyGoalDisclaimerTitle'.tr()),
                content: Text(
                  'dailyGoalDisclaimerContent'.tr(
                    namedArgs: {'suggestedAmount': _getWaterSuggestionUnitText(unitSystem.first)}
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
          );

          if(context.mounted) {
            context.go('/');
          }
        }
      } else if(newState.stage == .error) {
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
        child: (state.stage != .idle && state.stage != .error)
          ? Center(child: CircularProgressIndicator())
          : CustomScrollView(
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

                      HydrationFormView(
                        formKey: formKey, 
                        ageTextController: ageTextController, 
                        weightTextController: weightTextController
                      ),

                      Text('dataPrivacy'.tr()),

                      const Spacer(),
                    ],
                  ),
                )
          ],
        )
      ),
      floatingActionButton: state.stage == .idle
        ? FloatingActionButton(
            onPressed: () {
              if(formKey.currentState == null || !formKey.currentState!.validate()) {
                return;
              }

              ref
                .read(setupViewModelProvider.notifier)
                .completeSetup(ageTextController.text, weightTextController.text);
            },
            child: Icon(Icons.navigate_next),
          )
        : null
    );
  }

  String _getWaterSuggestionUnitText(UnitSystem unit) {
    return unit == UnitSystem.metric
      ? '${HydrationConstraints.maxWaterSuggestionMl} ${'ml'.tr()}'
      : '${HydrationConstraints.maxWaterSuggestionOz} ${'oz'.tr()}';
  }
}