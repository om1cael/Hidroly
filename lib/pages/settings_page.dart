import 'package:flutter/material.dart';
import 'package:hidroly/l10n/app_localizations.dart';
import 'package:hidroly/widgets/settings/sections/settings_about.dart';
import 'package:hidroly/widgets/settings/sections/settings_general.dart';
import 'package:hidroly/widgets/settings/sections/settings_notifications.dart';
import 'package:hidroly/widgets/settings/sections/settings_you.dart';
import 'package:hidroly/provider/settings_provider.dart';
import 'package:hidroly/theme/app_colors.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final isMetric = context.watch<SettingsProvider>().isMetric;
    if(isMetric == null) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator(),),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.settingsPageTitle
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          }, 
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.primaryText,
          ),
        ),
        titleSpacing: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SettingsGeneral(
                  isMetric: isMetric,
                ),
                SizedBox(height: 16,),
                SettingsYou(
                  isMetric: isMetric
                ),
                SizedBox(height: 16,),
                SettingsNotifications(),
                SizedBox(height: 16,),
                SettingsAbout(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}