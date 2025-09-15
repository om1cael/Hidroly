import 'package:flutter/material.dart';
import 'package:hidroly/data/repository/day_repository.dart';
import 'package:hidroly/domain/models/day.dart';

class SummaryWeeklyGraphicViewModel extends ChangeNotifier {
  SummaryWeeklyGraphicViewModel({
    required DayRepository dayRepository,
  }) : _dayRepository = dayRepository;

  final DayRepository _dayRepository;

  List<Day>? _dayList;
  List<Day>? get dayList => _dayList;

  Future<bool> loadWeekDays() async {
    Day? latestDay = await _dayRepository.findLatest();
    if(latestDay == null) return false;

    DateTime latestDate = latestDay.date;
    final weekday = latestDate.weekday % 7;

    final startOfTheWeek = latestDate.subtract(Duration(days: weekday));
    final endOfTheWeek = startOfTheWeek.add(Duration(days: 7));

    _dayList = 
      await _dayRepository.getMultipleDays(startOfTheWeek, endOfTheWeek, 7);

    notifyListeners();
    return true;
  }
}