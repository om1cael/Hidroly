import 'package:hidroly/data/database/database_helper.dart';
import 'package:hidroly/data/datasource/custom_cups_local_datasource_impl.dart';
import 'package:hidroly/data/datasource/daily_history_local_datasource_impl.dart';
import 'package:hidroly/data/datasource/day_local_datasource_impl.dart';
import 'package:hidroly/data/repository/custom_cups_repository.dart';
import 'package:hidroly/data/repository/daily_history_repository.dart';
import 'package:hidroly/data/repository/day_repository.dart';
import 'package:hidroly/provider/custom_cups_provider.dart';
import 'package:hidroly/provider/daily_history_provider.dart';
import 'package:hidroly/provider/day_provider.dart';
import 'package:hidroly/provider/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final class Providers {
  final providers = <SingleChildWidget>[
    Provider(create: (_) => DatabaseHelper()),
    ChangeNotifierProvider(create: (_) => SettingsProvider()),

    // Data Sources
    ProxyProvider<DatabaseHelper, DayLocalDataSourceImpl>(
      update: (_, db, _) => DayLocalDataSourceImpl(db)
    ),
    ProxyProvider<DatabaseHelper, CustomCupsLocalDataSourceImpl>(
      update: (_, db, _) => CustomCupsLocalDataSourceImpl(db)
    ),
    ProxyProvider<DatabaseHelper, DailyHistoryLocalDataSourceImpl>(
      update: (_, db, _) => DailyHistoryLocalDataSourceImpl(db),
    ),

    // Repositories
    ProxyProvider<DayLocalDataSourceImpl, DayRepository>(
      update: (_, datasource, _) => DayRepository(datasource)
    ),
    ProxyProvider<CustomCupsLocalDataSourceImpl, CustomCupsRepository>(
      update: (_, datasource, _) => CustomCupsRepository(datasource)
    ),
    ProxyProvider<DailyHistoryLocalDataSourceImpl, DailyHistoryRepository>(
      update: (_, datasource, _) => DailyHistoryRepository(datasource)
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