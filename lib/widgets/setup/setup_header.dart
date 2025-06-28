import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SetupHeader extends StatelessWidget {
  const SetupHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          'assets/images/water-drop.svg',
          height: 136,
          width: 126,
          colorFilter: ColorFilter.mode(Color(0xff8097D3), BlendMode.srcIn),
        ),
        Text(
          'Welcome',
          style: TextStyle(
            color: Color(0xffF9F9F9),
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'We just need to set things up. It will be quick and easy!',
          style: TextStyle(
            color: Color(0xffBEC0C5),
            fontSize: 20,
            fontWeight: FontWeight.w300,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}