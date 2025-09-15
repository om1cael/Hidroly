import 'package:flutter/material.dart';
import 'package:hidroly/ui/summary/view/summary_card.dart';
import 'package:hidroly/ui/summary/view_models/summary_global_stats_view_model.dart';
import 'package:logger/logger.dart';

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

        return GridView(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 90,
          ),
          children: [
            SummaryCard(
              title: 'Current Streak', 
              data: widget.viewModel.globalStatistic!.currentStreak.toString(),
            ),
            SummaryCard(
              title: 'Best Streak', 
              data: widget.viewModel.globalStatistic!.bestStreak.toString(),
            ),
            SummaryCard(
              title: 'Total Intake', 
              data: widget.viewModel.globalStatistic!.totalIntake.toString(),
            ),
            SummaryCard(
              title: 'Avg. Intake',
              data: widget.viewModel.globalStatistic!.averageIntake.toString(),
            ),
          ],
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