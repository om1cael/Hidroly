import 'package:fl_chart/fl_chart.dart';
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
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Weekly Intake',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSurface,
              borderRadius: BorderRadius.circular(16)
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
              child: SizedBox(
                height: 250,
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    maxY: 20,
                    backgroundColor: Theme.of(context).colorScheme.onSurface,
                    barTouchData: BarTouchData(enabled: false),
                    gridData: FlGridData(
                      drawVerticalLine: false,
                      getDrawingHorizontalLine: (value) {
                        return FlLine(
                          color: Colors.white38,
                          strokeWidth: 1, 
                        );
                      }
                    ),
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 24,
                          getTitlesWidget: (value, meta) {
                            return Text(
                              value.toInt().toString(),
                              style: Theme.of(context).textTheme.labelMedium,
                            );
                          }
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 28,
                          getTitlesWidget: (value, meta) {
                            const days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
                
                            int index = value.round();
                            if (index >= 0 && index < days.length) {
                              return Text(
                                days[index],
                                style: const TextStyle(fontSize: 12),
                              );
                            } else {
                              debugPrint('Out-of-range index in bottom axis: $index');
                              return const SizedBox.shrink();
                            }
                          },
                        ),
                      ),
                      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    ),
                    borderData: FlBorderData(show: false),
                    barGroups: List.generate(7, (index) {
                      return BarChartGroupData(
                        x: index,
                        barRods: [
                          BarChartRodData(
                            toY: (index + 10).toDouble(),
                            color: Theme.of(context).primaryColor,
                            width: 16,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ],
                      );
                    }),
                  ),
                ),
              ),
            ),
          )
        ]
      )
    );
  }
}