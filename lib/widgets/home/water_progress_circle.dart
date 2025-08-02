import 'package:flutter/material.dart';
import 'package:hidroly/l10n/app_localizations.dart';
import 'package:hidroly/provider/day_provider.dart';
import 'package:hidroly/utils/unit_tools.dart';
import 'package:provider/provider.dart';

class WaterProgressCircle extends StatelessWidget {
  final bool isMetric;

  const WaterProgressCircle({
    super.key,
    required this.isMetric,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<DayProvider>(
      builder: (context, provider, child) {
        final day = provider.day;

        // TODO: This should be better handled.
        if(day == null) {
          return const CircularProgressIndicator();
        }

        final double progress = (day.currentAmount / day.dailyGoal).clamp(0, 1);

        return Stack(
          alignment: AlignmentGeometry.xy(0, 0),
          children: [
            SizedBox(
              width: 280,
              height: 280,
              child: TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0.0, end: progress),
                duration: const Duration(milliseconds: 300),
                builder: (context, value, _) {
                  return CircularProgressIndicator(
                    value: value,
                    backgroundColor: Theme.of(context).colorScheme.onSurface,
                    strokeWidth: 20,
                    strokeCap: StrokeCap.round,
                    color: Theme.of(context).primaryColor,
                  );
                }
              ),
            ),
            Column(
              children: [
                Text(
                  UnitTools.getVolumeWithUnit(day.currentAmount, isMetric, context: context),
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  '${AppLocalizations.of(context)!.progressCircleOf} ${UnitTools.getVolumeWithUnit(day.dailyGoal, isMetric, context: context)}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            )
          ]
        );
      }
    );
  }
}