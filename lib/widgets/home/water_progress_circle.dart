import 'package:flutter/material.dart';
import 'package:hidroly/provider/user_provider.dart';
import 'package:provider/provider.dart';

class WaterProgressCircle extends StatelessWidget {
  const WaterProgressCircle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, provider, child) {
        final user = provider.user;

        // TODO: This should be better handled.
        if(user == null) {
          return const CircularProgressIndicator();
        }

        final double progress = (user.currentAmount / user.dailyGoal).clamp(0, 1);

        return Stack(
          alignment: AlignmentGeometry.xy(0, 0),
          children: [
            SizedBox(
                width: 280,
                height: 280,
                child: CircularProgressIndicator(
                  value: progress,
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
    );
  }
}