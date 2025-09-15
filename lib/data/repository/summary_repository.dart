import 'dart:convert';

import 'package:hidroly/domain/models/global_statistic.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SummaryRepository {
  var logger = Logger();

  final _asyncPrefs = SharedPreferencesAsync();
  final _globalStatisticsKey = "globalStatistics";

  Future<bool> saveGlobalStatistic(GlobalStatistic globalStatistic) async {
    try {
      await _asyncPrefs.setString(_globalStatisticsKey, jsonEncode(globalStatistic));
      return true;
    } catch (e) {
      logger.e('Failed to save global statistic: $e');
      return false;
    }
  }
  
  Future<GlobalStatistic> readGlobalStatistic() async {
    final defaultGlobalStatistic = GlobalStatistic(
      currentStreak: 0,
      bestStreak: 0,
      totalIntake: 0,
      averageIntake: 0
    );

    try {
      final globalStatisticString = await _asyncPrefs.getString(_globalStatisticsKey);
      if(globalStatisticString == null) {
        return defaultGlobalStatistic;
      }

      final globalStatisticsJson = jsonDecode(globalStatisticString);
      return GlobalStatistic.fromJson(globalStatisticsJson);
    } catch (e) {
      logger.e('Failed to read global statistic: $e');
      return defaultGlobalStatistic;
    }
  }
}