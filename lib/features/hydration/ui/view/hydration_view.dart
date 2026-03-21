import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hidroly/core/domain/enums/unit_systems.dart';
import 'package:hidroly/features/hydration/ui/view/components/hydration_progress_indicator.dart';
import 'package:hidroly/features/hydration/ui/view_model/hydration_view_model.dart';

class HydrationView extends ConsumerWidget {
  const HydrationView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(hydrationViewModelProvider);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: .center,
            crossAxisAlignment: .center,
            children: [
              state.when(
                data: (data) {
                  return HydrationProgressIndicator(
                    currentAmount: data.day.currentAmount, 
                    dailyGoal: data.day.dailyGoal, 
                    unitText: getUnitText(data.unitSystem),
                  );
                }, 
                error: (_, _) => Placeholder(), 
                loading: () => CircularProgressIndicator(),
              ),
            ],
          ),
        )
      ),
    );
  }

  String getUnitText(UnitSystem unitSystem) {
    return unitSystem == UnitSystem.metric
      ? 'ml'.tr()
      : 'oz'.tr();
  }
}