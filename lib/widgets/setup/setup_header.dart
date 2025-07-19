import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hidroly/l10n/app_localizations.dart';

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
          colorFilter: ColorFilter.mode(Theme.of(context).primaryColor, BlendMode.srcIn),
        ),
        Text(
          AppLocalizations.of(context)!.setupWelcomeTitle,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        Text(
          AppLocalizations.of(context)!.setupWelcomeSubtitle,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}