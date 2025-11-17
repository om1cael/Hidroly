import 'package:flutter/material.dart';
import 'package:hidroly/domain/models/enum/frequency.dart';
import 'package:hidroly/l10n/app_localizations.dart';
import 'package:hidroly/provider/settings_provider.dart';
import 'package:provider/provider.dart';

class SettingsFrequencyPage extends StatefulWidget {
  final ValueNotifier<Frequency> frequency;

  const SettingsFrequencyPage({
    super.key,
    required this.frequency,
  });

  @override
  State<SettingsFrequencyPage> createState() => _SettingsFrequencyPageState();
}

class _SettingsFrequencyPageState extends State<SettingsFrequencyPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final loadedFrequency = await _loadFrequency();

      setState(() {
        widget.frequency.value = loadedFrequency;
      });
    });
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
            color: Theme.of(context).iconTheme.color,
            semanticLabel: AppLocalizations.of(context)!.goBackIconSemanticLabel,
          ),
        ),
        titleSpacing: 0,
      ),
      body: RadioGroup(
        groupValue: widget.frequency.value,
        onChanged: (value) => _updateRadioValue(value, provider),
        child: Column(
          children: [
            RadioListTile(
              title: Text(
                AppLocalizations.of(context)!.minutes('15'),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              value: Frequency.every15Minutes, 
            ),
            RadioListTile(
              title: Text(
                AppLocalizations.of(context)!.minutes('30'),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              value: Frequency.every30Minutes, 
            ),
            RadioListTile(
              title: Text(
                AppLocalizations.of(context)!.hour('1'),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              value: Frequency.everyHour, 
            ),
            RadioListTile(
              title: Text(
                AppLocalizations.of(context)!.hours('2'),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              value: Frequency.every2Hours, 
            ),
            RadioListTile(
              title: Text(
                AppLocalizations.of(context)!.hours('3'),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              value: Frequency.every3Hours, 
            ),
            RadioListTile(
              title: Text(
                AppLocalizations.of(context)!.hours('4'),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              value: Frequency.every4Hours,
            ),
          ],
        ),
      ),
    );
  }

  void _updateRadioValue(Frequency? newFrequency, SettingsProvider provider) {
    setState(() {
      widget.frequency.value = newFrequency!;
    });
  }

  Future<Frequency> _loadFrequency() async {
    int frequencyValue = await _getFrequency();
    return Frequency.getFrequency(frequencyValue);
  }

  Future<int> _getFrequency() async {
    final provider = context.read<SettingsProvider>();
    await provider.readFrequency();
    return provider.frequencyHolder.frequency;
  }
}