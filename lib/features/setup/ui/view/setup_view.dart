import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hidroly/core/ui/view/hydration_form_view.dart';
import 'package:hidroly/core/ui/view/notification_settings_card.dart';
import 'package:hidroly/core/ui/view/notification_settings_view.dart';
import 'package:hidroly/core/ui/view_model/hydration_form_view_model.dart';
import 'package:hidroly/core/domain/hydration_constraints.dart';
import 'package:hidroly/core/domain/enums/unit_systems.dart';
import 'package:hidroly/features/setup/ui/state/setup_state.dart';
import 'package:hidroly/features/setup/ui/view/components/header_text.dart';
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
      newState.maybeWhen(
        done: (dailyGoalClamped) async {
          if(dailyGoalClamped) {
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
          }

          if(context.mounted) {
            context.go('/');
          }
        },
        notifications: () {
          showDialog(
            context: context, 
            builder: (_) {
              return AlertDialog(
                title: Text('notifications'.tr()),
                content: Text('notificationPermissionRequest'.tr()),
                actions: [
                  TextButton(onPressed: () => Navigator.of(context).pop(), child: Text('no'.tr())),
                  FilledButton(
                    onPressed: () {
                      ref.read(setupViewModelProvider.notifier).requestNotificationPermission();
                      Navigator.of(context).pop();
                    }, 
                    child: Text('ok'.tr()),
                  ),
                ],
              );
            }
          );
        },
        error: (_) => {
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
          ),
        },
        orElse: () {},
      );
    });

    return Scaffold(
      body: SafeArea(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            final offsetAnimation = Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOutCubic,
            ));

            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: offsetAnimation,
                child: child,
              ),
            );
          },
          child: state.when(
            profile: () => Padding(
              key: ValueKey(1),
              padding: const EdgeInsets.all(48.0),
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
              ),
            ), 
            notifications: () => Padding(
              key: ValueKey(2),
              padding: const EdgeInsets.all(24.0),
              child: NotificationSettingsView(),
            ),
            processing: () => Center(child: CircularProgressIndicator(),), 
            done: (_) => Center(child: CircularProgressIndicator(),),
            error: (_) => Center(child: Text('errorOccurred'.tr()),),
          ),
        ),
      ),
      floatingActionButton: state.maybeWhen(
        profile: () => FloatingActionButton(
          onPressed: () {
            if(formKey.currentState == null || !formKey.currentState!.validate()) {
              return;
            }

            ref
              .read(setupViewModelProvider.notifier)
              .goToNotificationsStage();
          },
          child: Icon(Icons.navigate_next),
        ),
        notifications: () => FloatingActionButton(
          onPressed: () {
            ref
              .read(setupViewModelProvider.notifier)
              .completeSetup(ageTextController.text, weightTextController.text);
          },
          child: Icon(Icons.done),
        ),
        orElse: () => null,
      ),
    );
  }

  String _getWaterSuggestionUnitText(UnitSystem unit) {
    return unit == UnitSystem.metric
      ? '${HydrationConstraints.maxWaterSuggestionMl} ${'ml'.tr()}'
      : '${HydrationConstraints.maxWaterSuggestionOz} ${'oz'.tr()}';
  }
}