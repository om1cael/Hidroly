import 'package:flutter/material.dart';
import 'package:hidroly/l10n/app_localizations.dart';
import 'package:hidroly/pages/settings_page.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // TODO
              ],
            ),
          )
        ),
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      title: Text(AppLocalizations.of(context)!.bottomNavSummaryLabel),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => SettingsPage())
            );
          }, 
          icon: Icon(
            Icons.settings,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
      ],
    );
  }
}