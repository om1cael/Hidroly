import 'package:flutter/material.dart';
import 'package:hidroly/l10n/app_localizations.dart';
import 'package:hidroly/provider/day_provider.dart';
import 'package:hidroly/provider/settings_provider.dart';
import 'package:hidroly/utils/unit_tools.dart';
import 'package:provider/provider.dart';

class WaterProgressCircle extends StatelessWidget {
  const WaterProgressCircle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<DayProvider>(
      builder: (context, provider, child) {
        final day = provider.day;

        if(day == null) {
          return const CircularProgressIndicator();
        }

        final double progress = (day.currentAmount / day.dailyGoal).clamp(0, 1);

        final primaryColor = Theme.of(context).primaryColor;
        final completedColor = Color(0xff92D6C4);

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
                    color: Color.lerp(
                      primaryColor, 
                      completedColor, 
                      ((value - 0.7) * (1 / 0.3)).clamp(0.0, 1.0) // Only starts to change if value >= 70%
                    ),
                  );
                }
              ),
            ),
            Consumer<SettingsProvider>(
              builder: (_, provider, _) {
                return Column(
                  children: [
                    Text(
                      UnitTools.getVolumeWithUnit(day.currentAmount, provider.isMetric, context: context),
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    Text(
                      '${AppLocalizations.of(context)!.progressCircleOf} ${UnitTools.getVolumeWithUnit(day.dailyGoal, provider.isMetric, context: context)}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                );
              }
            )
          ]
        );
      }
    );
  }
}