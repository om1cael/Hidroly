import 'package:flutter/material.dart';

class WaterProgressCircle extends StatelessWidget {
  const WaterProgressCircle({
    super.key,
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
              value: 1,
              backgroundColor: Color(0xff31333A),
              strokeWidth: 20,
              strokeCap: StrokeCap.round,
              color: Color(0xff8097D3),
            ),
        ),
        Column(
          children: [
            Text(
              '2.000ml',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: Color(0xffF9F9F9),
              ),
            ),
            Text(
              'of 2.000ml',
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