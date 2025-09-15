import 'package:flutter/material.dart';

class SummaryWeeklyIntakeGraphic extends StatefulWidget {
  const SummaryWeeklyIntakeGraphic({super.key});

  @override
  State<SummaryWeeklyIntakeGraphic> createState() => _SummaryWeeklyIntakeGraphicState();
}

class _SummaryWeeklyIntakeGraphicState extends State<SummaryWeeklyIntakeGraphic> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Weekly Intake',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}