import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hidroly/core/domain/enums/unit_systems.dart';
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
                  return SizedBox(
                    height: 280,
                    width: 280,
                    child: Stack(
                      alignment: .xy(0, 0),
                      children: [
                        SizedBox.expand(
                          child: CircularProgressIndicator(
                            value: (data.day.currentAmount / data.day.dailyGoal).clamp(0, 1),
                            strokeWidth: 16,
                            strokeCap: .round,
                            backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: .center,
                          crossAxisAlignment: .center,
                          children: [
                            Text('${data.day.currentAmount} ${getUnitText(data.unitSystem)}', style: Theme.of(context).textTheme.headlineLarge),
                            Text('${'of'.tr()} ${data.day.dailyGoal} ${getUnitText(data.unitSystem)}', style: Theme.of(context).textTheme.bodyLarge,),
                          ],
                        )
                      ],
                    ),
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