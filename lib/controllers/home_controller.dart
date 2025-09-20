import 'package:flutter/widgets.dart';
import 'package:hidroly/domain/models/day.dart';
import 'package:hidroly/provider/custom_cups_provider.dart';
import 'package:hidroly/provider/daily_history_provider.dart';
import 'package:hidroly/provider/day_provider.dart';
import 'package:hidroly/provider/settings_provider.dart';
import 'package:provider/provider.dart';

class HomeController {
  Future<bool> initializeHome(BuildContext context) async {
    try {
      final wasDayLoaded = await loadLatestDay(context);
      if(!wasDayLoaded) {
        return false;
      }

      if(!context.mounted) return false;
      await Future.wait([
        createAndLoadIfNewDay(context),
        loadCustomCups(context),
        loadDailyHistory(context),
        loadAllSettings(context),
      ]);

      return true;
    } on Exception {
      return false;
    }
  }

  Future<void> loadDailyHistory(BuildContext context, {Day? currentDay}) async {
    currentDay ??= context.read<DayProvider>().day;
    if(currentDay == null) return;
    
    final dayId = currentDay.id!;
    await context.read<DailyHistoryProvider>().getAll(dayId);
  }

  Future<bool> loadLatestDay(BuildContext context) async =>
    await context.read<DayProvider>().loadLatestDay();

  Future<void> createAndLoadIfNewDay(BuildContext context) async =>
    await context.read<DayProvider>().createAndLoadIfNewDay();

  Future<void> loadCustomCups(BuildContext context) async =>
    await context.read<CustomCupsProvider>().loadCustomCups();

  Future<void> loadAllSettings(BuildContext context) async => 
    await context.read<SettingsProvider>().loadAllSettings();
}