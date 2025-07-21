import 'package:flutter/material.dart';
import 'package:hidroly/l10n/app_localizations.dart';
import 'package:hidroly/provider/settings_provider.dart';
import 'package:hidroly/theme/app_colors.dart';
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
    _loadUnitState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.read<SettingsProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Unit system'),
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
              '${AppLocalizations.of(context)!.metric} (${AppLocalizations.of(context)!.setupUnitMetric})',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            value: true, 
            groupValue: selectedMetric,
            onChanged: (val) {
              setState(() {
                selectedMetric = val!;
              });

              provider.updateIsMetric(selectedMetric);
            },
          ),
          RadioListTile(
            title: Text(
              '${AppLocalizations.of(context)!.imperial} (${AppLocalizations.of(context)!.setupUnitImperial})',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            value: false, 
            groupValue: selectedMetric,
            onChanged: (val) {
              setState(() {
                selectedMetric = val!;
              });

              provider.updateIsMetric(selectedMetric);
            },
          ),
        ],
      ),
    );
  }

  void _loadUnitState() {
    final isMetric = context.read<SettingsProvider>().isMetric;
    if(isMetric != null) {
      selectedMetric = isMetric;
    }
  }
}