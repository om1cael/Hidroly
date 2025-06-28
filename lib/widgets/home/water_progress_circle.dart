import 'package:flutter/material.dart';
import 'package:hidroly/controller/home_controller.dart';
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
              backgroundColor: Color(0xff31333A),
              strokeWidth: 20,
              strokeCap: StrokeCap.round,
              color: Color(0xff8097D3),
            ),
        ),
        Column(
          children: [
            Text(
              '${user.currentAmount}ml',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: Color(0xffF9F9F9),
              ),
            ),
            Text(
              'of ${user.dailyGoal}ml',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 20,
                color: Color(0xffBEC0C5),
              ),
            ),
          ],
        )
      ]
    );
  }
}