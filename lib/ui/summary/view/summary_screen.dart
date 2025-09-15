import 'package:flutter/material.dart';
import 'package:hidroly/data/repository/summary_repository.dart';
import 'package:hidroly/l10n/app_localizations.dart';
import 'package:hidroly/pages/settings_page.dart';
import 'package:hidroly/ui/summary/view/summary_global_stats.dart';
import 'package:hidroly/ui/summary/view/summary_weekly_intake_graphic.dart';
import 'package:hidroly/ui/summary/view_models/summary_global_stats_view_model.dart';
import 'package:provider/provider.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SummaryGlobalStats(
                  viewModel: SummaryGlobalStatsViewModel(
                    summaryRepository: context.read<SummaryRepository>(),
                  ),
                ),
                SizedBox(height: 32,),
                SummaryWeeklyIntakeGraphic(),
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