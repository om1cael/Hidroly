import 'package:flutter/material.dart';
import 'package:hidroly/ui/summary/view/summary_card.dart';
import 'package:hidroly/ui/summary/view_models/summary_global_stats_view_model.dart';

class SummaryGlobalStats extends StatelessWidget {
  const SummaryGlobalStats({
    super.key,
    required this.viewModel,
  });

  final SummaryGlobalStatsViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    viewModel.loadGlobalStatistics();

    if(viewModel.globalStatistic == null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Global Statistics', style: Theme.of(context).textTheme.titleLarge,),
          Text('Your data will appear here soon!')
        ],
      );
    }

    return GridView(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 90,
      ),
      children: [
        SummaryCard(
          title: 'Current Streak', 
          data: viewModel.globalStatistic!.currentStreak as String,
        ),
        SummaryCard(
          title: 'Best Streak', 
          data: viewModel.globalStatistic!.bestStreak as String,
        ),
        SummaryCard(
          title: 'Total Intake', 
          data: viewModel.globalStatistic!.totalIntake as String,
        ),
        SummaryCard(
          title: 'Avg. Intake',
          data: viewModel.globalStatistic!.averageIntake as String,
        ),
      ],
    );
  }
}