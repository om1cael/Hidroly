import 'package:flutter/material.dart';

class SettingsSwitch extends StatefulWidget {
  const SettingsSwitch({
    super.key,
    required this.title,
    required this.switchValue,
    required this.onChanged,
  });

  final String title;
  final bool switchValue;
  final ValueChanged<bool> onChanged;

  @override
  State<SettingsSwitch> createState() => _SettingsSwitchState();
}

class _SettingsSwitchState extends State<SettingsSwitch> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.title,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        Switch(
          value: widget.switchValue, 
          onChanged: widget.onChanged,
        ),
      ],
    );
  }
}