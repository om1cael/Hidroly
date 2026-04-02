import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hidroly/features/hydration/domain/value_objects/cup_value.dart';
import 'package:hidroly/features/hydration/ui/extensions/unit_system_ui_extension.dart';
import 'package:hidroly/features/hydration/ui/state/hydration_state.dart';
import 'package:hidroly/features/hydration/ui/view/components/cup_button.dart';
import 'package:hidroly/features/hydration/ui/view/components/cup_creation_form.dart';
import 'package:hidroly/features/hydration/ui/view/components/history_modal.dart';
import 'package:hidroly/features/hydration/ui/view/components/hydration_progress_indicator.dart';
import 'package:hidroly/features/hydration/ui/view_model/hydration_view_model.dart';

class HydrationView extends ConsumerStatefulWidget {
  const HydrationView({super.key});

  @override
  ConsumerState<HydrationView> createState() => _HydrationViewState();
}

class _HydrationViewState extends ConsumerState<HydrationView> {
  late final TextEditingController _cupTextController;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _cupTextController = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    _cupTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(hydrationViewModelProvider);

    return state.when(
      data: (data) => Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () => showModalBottomSheet(context: context, builder: (_) => HistoryModal()),
              icon: Icon(Icons.history),
            ),
          ],
        ),
        body: SafeArea(
          minimum: EdgeInsets.all(24.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  spacing: 48,
                  children: [
                    HydrationProgressIndicator(
                      currentAmount: data.day.currentAmount.valueIn(data.unitSystem),
                      dailyGoal: data.day.dailyGoal.valueIn(data.unitSystem),
                      unitText: data.unitSystem.unitLabel,
                    ),

                    SizedBox(
                      height: 36,
                      child: ListView.separated(
                        scrollDirection: .horizontal,
                        shrinkWrap: true,
                        itemCount: data.cups.length,
                        itemBuilder: (_, index) {
                          final cup = data.cups[index];
                      
                          return CupButton(
                            amount: cup.amount.valueIn(data.unitSystem),
                            unit: data.unitSystem.unitLabel,
                            onPressed: () => ref.read(hydrationViewModelProvider.notifier).addWater(cup.amount.ml),
                          );
                        },
                        separatorBuilder: (_, _) => SizedBox(width: 12),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => showCupCreationModal(context, data),
          child: const Icon(Icons.add),
        ),
      ),
      error: (_, error) => Scaffold(body: Center(child: Text(error.toString()))),
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
    );
  }

  void showCupCreationModal(BuildContext context, HydrationState data) {
    _cupTextController.clear();
    
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 20,
          right: 20,
          top: 20,
        ),
        child: CupCreationForm(
          formKey: _formKey,
          controller: _cupTextController,
          unitSystem: data.unitSystem,
          validator: (value) {
            final status = ref
              .read(hydrationViewModelProvider.notifier)
              .validateCupValue(value);
            
            switch(status) {
              case .noInput:
                return 'inputRequired'.tr(namedArgs: {'requiredInput': 'cupValue'.tr().toLowerCase()});
              case .outOfBoundaries:
                return 'inputRequirement'.tr(namedArgs: {'minValue': CupValue.minValueFor(data.unitSystem).toString(), 'maxValue': CupValue.maxValueFor(data.unitSystem).toString()});
              default: return null;
            }
          },
          onCreatePressed: () async {
            if(_formKey.currentState == null || !_formKey.currentState!.validate()) return;
            
            await ref
              .read(hydrationViewModelProvider.notifier)
              .createCup(_cupTextController.text);
            
            if(context.mounted) {
              Navigator.of(context).pop();
            }
          },
        ),
      ),
    );
  }
}