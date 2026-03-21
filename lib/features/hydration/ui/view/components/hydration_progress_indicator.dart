import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HydrationProgressIndicator extends StatelessWidget {
  final int currentAmount;
  final int dailyGoal;
  final String unitText;

  const HydrationProgressIndicator({
    super.key,
    required this.currentAmount,
    required this.dailyGoal,
    required this.unitText,
  });

  @override
  Widget build(BuildContext context) {
    final progress = (currentAmount / dailyGoal).clamp(0.0, 1.0);

    return SizedBox(
      height: 280,
      width: 280,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox.expand(
            child: CircularProgressIndicator(
              value: progress,
              strokeWidth: 16,
              strokeCap: StrokeCap.round,
              backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$currentAmount $unitText',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text(
                '${'of'.tr()} $dailyGoal $unitText',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          )
        ],
      ),
    );
  }
}