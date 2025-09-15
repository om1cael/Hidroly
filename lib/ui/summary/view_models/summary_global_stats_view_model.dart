import 'package:flutter/material.dart';
import 'package:hidroly/data/repository/summary_repository.dart';
import 'package:hidroly/domain/models/global_statistic.dart';
import 'package:logger/logger.dart';

class SummaryGlobalStatsViewModel extends ChangeNotifier {
  SummaryGlobalStatsViewModel({
    required SummaryRepository summaryRepository,
  }) : _summaryRepository = summaryRepository;

  var logger = Logger();
  final SummaryRepository _summaryRepository;

  GlobalStatistic? _globalStatistic;
  GlobalStatistic? get globalStatistic => _globalStatistic;

  Future<bool> loadGlobalStatistics() async {
    try {
      _globalStatistic = await _summaryRepository.readGlobalStatistic();
      if(_globalStatistic == null) return false;

      notifyListeners();
      return true; 
    } catch (e) {
      logger.e("Failed to load global statistics: $e");
      return false;
    }
  }
}