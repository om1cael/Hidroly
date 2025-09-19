import 'package:hidroly/data/repository/summary_repository.dart';
import 'package:hidroly/data/services/database/database_service.dart';
import 'package:hidroly/data/repository/custom_cups_repository.dart';
import 'package:hidroly/data/repository/daily_history_repository.dart';
import 'package:hidroly/data/repository/day_repository.dart';
import 'package:hidroly/provider/app_state_provider.dart';
import 'package:hidroly/provider/custom_cups_provider.dart';
import 'package:hidroly/provider/daily_history_provider.dart';
import 'package:hidroly/provider/day_provider.dart';
import 'package:hidroly/provider/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final class Providers {
  final providers = <SingleChildWidget>[
    Provider(create: (_) => DatabaseService()),
    
    ChangeNotifierProvider(create: (_) => SettingsProvider()),
    ChangeNotifierProvider(create: (_) => AppStateProvider()),

    // Repositories
    ProxyProvider<DatabaseService, DayRepository>(
      update: (_, database, _) => DayRepository(database)
    ),
    ProxyProvider<DatabaseService, CustomCupsRepository>(
      update: (_, database, _) => CustomCupsRepository(database)
    ),
    ProxyProvider<DatabaseService, DailyHistoryRepository>(
      update: (_, database, _) => DailyHistoryRepository(database)
    ),
    ProxyProvider<DatabaseService, SummaryRepository>(
      update: (_, database, _) => SummaryRepository(database)
    ),

    // Providers
    ChangeNotifierProxyProvider<DayRepository, DayProvider>(
      create: (context) => DayProvider(), 
      update: (_, repository, provider) => provider!..setRepository(repository)
    ),
    ChangeNotifierProxyProvider<CustomCupsRepository, CustomCupsProvider>(
      create: (context) => CustomCupsProvider(), 
      update: (_, repository, provider) => provider!..setRepository(repository)
    ),
    ChangeNotifierProxyProvider<DailyHistoryRepository, DailyHistoryProvider>(
      create: (context) => DailyHistoryProvider(), 
      update: (_, repository, provider) => provider!..setRepository(repository)
    )
  ];
}