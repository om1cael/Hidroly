import 'package:flutter/material.dart';
import 'package:hidroly/model/User.dart';

class WaterProgressCircle extends StatelessWidget {
  User user;

  WaterProgressCircle({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentGeometry.xy(0, 0),
      children: [
        SizedBox(
            width: 280,
            height: 280,
            child: CircularProgressIndicator(
              value: (user.currentAmount / user.dailyGoal).clamp(0, 1),
              backgroundColor: Theme.of(context).colorScheme.onSurface,
              strokeWidth: 20,
              strokeCap: StrokeCap.round,
              color: Theme.of(context).primaryColor,
            ),
        ),
        Column(
          children: [
            Text(
              '${user.currentAmount}ml',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Text(
              'of ${user.dailyGoal}ml',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        )
      ]
    );
  }
}