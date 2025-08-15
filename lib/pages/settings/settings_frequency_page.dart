import 'package:flutter/material.dart';
import 'package:hidroly/data/model/enum/frequency.dart';
import 'package:hidroly/l10n/app_localizations.dart';
import 'package:hidroly/provider/settings_provider.dart';
import 'package:hidroly/theme/app_colors.dart';
import 'package:provider/provider.dart';

class SettingsFrequencyPage extends StatefulWidget {
  const SettingsFrequencyPage({super.key});

  @override
  State<SettingsFrequencyPage> createState() => _SettingsFrequencyPageState();
}

class _SettingsFrequencyPageState extends State<SettingsFrequencyPage> {
  Frequency frequency = Frequency.every2Hours;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.read<SettingsProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settingsNotificationsFrequency),
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
      body: Column(
        children: [
          RadioListTile(
            title: Text(
              '15 minutes',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            value: Frequency.every15Minutes, 
            groupValue: frequency,
            onChanged: (val) => _updateRadioValue(val, provider),
          ),
          RadioListTile(
            title: Text(
              '30 minutes',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            value: Frequency.every30Minutes, 
            groupValue: frequency,
            onChanged: (val) => _updateRadioValue(val, provider),
          ),
          RadioListTile(
            title: Text(
              '1 hour',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            value: Frequency.everyHour, 
            groupValue: frequency,
            onChanged: (val) => _updateRadioValue(val, provider),
          ),
          RadioListTile(
            title: Text(
              '2 hours',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            value: Frequency.every2Hours, 
            groupValue: frequency,
            onChanged: (val) => _updateRadioValue(val, provider),
          ),
          RadioListTile(
            title: Text(
              '3 hours',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            value: Frequency.every3Hours, 
            groupValue: frequency,
            onChanged: (val) => _updateRadioValue(val, provider),
          ),
          RadioListTile(
            title: Text(
              '4 hours',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            value: Frequency.every4Hours, 
            groupValue: frequency,
            onChanged: (val) => _updateRadioValue(val, provider),
          ),
        ],
      ),
    );
  }

  void _updateRadioValue(Frequency? newFrequency, SettingsProvider provider) {
    setState(() {
      frequency = newFrequency!;
    });

    context.read<SettingsProvider>().updateFrequency(
      newFrequency!.frequency
    );
  }
}