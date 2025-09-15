import 'package:flutter/material.dart';
import 'package:hidroly/ui/summary/view/summary_card.dart';

class SummaryGlobalStats extends StatelessWidget {
  const SummaryGlobalStats({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 90,
      ),
      children: [
        SummaryCard(title: 'Current Streak', data: '7 days'),
        SummaryCard(title: 'Best Streak', data: '7 days'),
        SummaryCard(title: 'Total Intake', data: '500ml'),
        SummaryCard(title: 'Avg. Intake', data: '250ml'),
      ],
    );
  }
}