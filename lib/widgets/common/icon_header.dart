import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconHeader extends StatelessWidget {
  final String iconAsset;
  final String title;
  final String description;

  const IconHeader({
    super.key,
    required this.iconAsset,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          iconAsset,
          height: 136,
          width: 126,
          colorFilter: ColorFilter.mode(Theme.of(context).primaryColor, BlendMode.srcIn),
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        Text(
          description,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}