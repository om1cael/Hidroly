import 'package:flutter/material.dart';
import 'package:hidroly/l10n/app_localizations.dart';
import 'package:hidroly/theme/app_colors.dart';
import 'package:hidroly/widgets/settings/settings_text_button.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsAbout extends StatelessWidget {
  const SettingsAbout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.settingsAboutSection,
          style: TextStyle(
            color: AppColors.primaryText,
            fontWeight: FontWeight.bold,
          ),
        ),
        SettingsTextButton(
          title: AppLocalizations.of(context)!.settingsContribute,
          description: AppLocalizations.of(context)!.settingsContributeDescription,
          onPressed: () async {
            final Uri gitHubRepository = Uri.parse('https://github.com/om1cael/Hidroly');
            await launchUrl(
              gitHubRepository,
              mode: LaunchMode.externalApplication,
            );
          },
        ),
      ],
    );
  }
}