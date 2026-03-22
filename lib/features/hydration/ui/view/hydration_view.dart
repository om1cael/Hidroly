import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hidroly/core/domain/enums/unit_systems.dart';
import 'package:hidroly/features/hydration/ui/view/components/hydration_progress_indicator.dart';
import 'package:hidroly/features/hydration/ui/view_model/hydration_view_model.dart';

// TODO: convert hydration data to imperial when necessary
// TODO: add cups
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
                    currentAmount: getValueBasedOnUnit(data.unitSystem, data.day.currentAmount), 
                    dailyGoal: getValueBasedOnUnit(data.unitSystem, data.day.dailyGoal), 
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

  int getValueBasedOnUnit(UnitSystem unitSystem, int value) {
    return unitSystem == .metric
      ? value
      : (value / 29.574).round();
  }

  String getUnitText(UnitSystem unitSystem) {
    return unitSystem == .metric
      ? 'ml'.tr()
      : 'oz'.tr();
  }
}