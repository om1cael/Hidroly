import 'dart:ui';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hidroly/domain/models/day.dart';
import 'package:hidroly/l10n/app_localizations.dart';
import 'package:hidroly/ui/summary/view_models/summary_weekly_graphic_view_model.dart';
import 'package:intl/intl.dart';

class SummaryWeeklyIntakeGraphic extends StatefulWidget {
  const SummaryWeeklyIntakeGraphic({
    super.key,
    required SummaryWeeklyGraphicViewModel viewModel,
  }) : _viewModel = viewModel;

  final SummaryWeeklyGraphicViewModel _viewModel;

  @override
  State<SummaryWeeklyIntakeGraphic> createState() => _SummaryWeeklyIntakeGraphicState();
}

class _SummaryWeeklyIntakeGraphicState extends State<SummaryWeeklyIntakeGraphic> {
  @override
  void initState() {
    widget._viewModel.loadWeekDays();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: FutureBuilder(
        future: widget._viewModel.loadWeekDays(),
        initialData: widget._viewModel.dayList,
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if((snapshot.hasData && snapshot.data == false) || !snapshot.hasData || snapshot.hasError) {
            return ChartNotReady();
          }
      
          final dayList = widget._viewModel.dayList!;
      
          final highestAmountFromDays = dayList
            .reduce((a, b) => a.currentAmount > b.currentAmount ? a : b)
            .currentAmount;
      
          return Column(
            spacing: 16,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.weeklyIntakeTitle,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              IntakeGraphic(
                highestAmountFromDays: highestAmountFromDays, 
                dayList: dayList
              ),
            ]
          );
        }
      ),
    );
  }
}

class ChartNotReady extends StatelessWidget {
  const ChartNotReady({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        Text(
          AppLocalizations.of(context)!.weeklyIntakeTitle,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Text(
          AppLocalizations.of(context)!.weeklyIntakeNoData,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontSize: 14,
            color: Theme.of(context).textTheme.bodySmall!.color,
          ),
        ),
      ],
    );
  }
}

class IntakeGraphic extends StatelessWidget {
  const IntakeGraphic({
    super.key,
    required this.highestAmountFromDays,
    required this.dayList,
  });

  final int highestAmountFromDays;
  final List<Day> dayList;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              maxY: highestAmountFromDays.toDouble(),
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
                    reservedSize: 40,
                    getTitlesWidget: (value, meta) {
                      return Text(
                        value.toInt().toString(),
                        style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontSize: 10,
                        ),
                      );
                    }
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 28,
                    getTitlesWidget: (value, meta) {
                      final days = getLocalizedWeekdayAbbreviations(PlatformDispatcher.instance.locale.toString());
          
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
              barGroups: List.generate(dayList.length, (index) {
                final day = dayList[index];
    
                return BarChartGroupData(
                  x: dayList[index].date.weekday,
                  barRods: [
                    BarChartRodData(
                      toY: day.currentAmount.toDouble(),
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
    );
  }

  List<String> getLocalizedWeekdayAbbreviations(String locale) {
    final baseDate = DateTime(2024, 1, 7);
    return List.generate(7, (index) {
      final date = baseDate.add(Duration(days: index));
      return DateFormat.E(locale).format(date).replaceAll('.', '');
    });
  }
}