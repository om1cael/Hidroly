import 'package:flutter/material.dart';
import 'package:hidroly/provider/settings_provider.dart';
import 'package:hidroly/ui/summary/view/summary_card.dart';
import 'package:hidroly/ui/summary/view_models/summary_global_stats_view_model.dart';
import 'package:hidroly/utils/unit_tools.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class SummaryGlobalStats extends StatefulWidget {
  const SummaryGlobalStats({
    super.key,
    required this.viewModel,
  });

  final SummaryGlobalStatsViewModel viewModel;

  @override
  State<SummaryGlobalStats> createState() => _SummaryGlobalStatsState();
}

class _SummaryGlobalStatsState extends State<SummaryGlobalStats> {
  final logger = Logger();

  @override
  void initState() {
    widget.viewModel.loadGlobalStatistics();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.viewModel.loadGlobalStatistics(),
      initialData: widget.viewModel.globalStatistic,
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if(snapshot.hasData && snapshot.data == false) {
          return GlobalStatsDataNotAvailable();
        }

        final currentStreak = widget.viewModel.globalStatistic!.currentStreak.toString();
        final bestStreak = widget.viewModel.globalStatistic!.bestStreak.toString();

        return Consumer<SettingsProvider>(
          builder: (context, provider, _) {
            final totalIntake = UnitTools.getVolumeWithUnit(
              widget.viewModel.globalStatistic!.totalIntake,
              provider.isMetric,
              context: context,
            );

            final averageIntake = UnitTools.getVolumeWithUnit(
              widget.viewModel.globalStatistic!.averageIntake, 
              provider.isMetric,
              context: context,
            );

            return GridView(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 90,
              ),
              children: [
                SummaryCard(
                  title: 'Current Streak', 
                  data: '$currentStreak days',
                ),
                SummaryCard(
                  title: 'Best Streak', 
                  data: '$bestStreak days',
                ),
                SummaryCard(
                  title: 'Total Intake', 
                  data: totalIntake
                ),
                SummaryCard(
                  title: 'Avg. Intake',
                  data: averageIntake,
                ),
              ],
            );
          }
        );
      }
    );
  }
}

class GlobalStatsDataNotAvailable extends StatelessWidget {
  const GlobalStatsDataNotAvailable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Global Statistics', style: Theme.of(context).textTheme.titleLarge,),
        Text('Your data will appear here soon!')
      ],
    );
  }
}