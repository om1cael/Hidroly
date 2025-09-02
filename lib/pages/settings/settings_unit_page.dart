import 'package:flutter/material.dart';
import 'package:hidroly/l10n/app_localizations.dart';
import 'package:hidroly/provider/settings_provider.dart';
import 'package:provider/provider.dart';

class SettingsUnitPage extends StatefulWidget {
  const SettingsUnitPage({super.key});

  @override
  State<SettingsUnitPage> createState() => _SettingsUnitPageState();
}

class _SettingsUnitPageState extends State<SettingsUnitPage> {
  bool selectedMetric = true;

  @override
  void initState() {
    super.initState();
    _loadUnitState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.read<SettingsProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settingsUnitSystem),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          }, 
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
        titleSpacing: 0,
      ),
      body: RadioGroup(
        groupValue: selectedMetric,
        onChanged: (value) => _updateRadioValue(value, provider),
        child: Column(
          children: [
            RadioListTile(
              title: Text(
                '${AppLocalizations.of(context)!.metric} (${AppLocalizations.of(context)!.setupUnitMetric})',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              value: true,
            ),
            RadioListTile(
              title: Text(
                '${AppLocalizations.of(context)!.imperial} (${AppLocalizations.of(context)!.setupUnitImperial})',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              value: false,
            ),
          ],
        ),
      ),
    );
  }

  void _updateRadioValue(bool? val, SettingsProvider provider) {
    setState(() {
      selectedMetric = val!;
    });
    
    provider.updateIsMetric(selectedMetric);
  }

  void _loadUnitState() {
    selectedMetric = context.read<SettingsProvider>().isMetric;
  }
}