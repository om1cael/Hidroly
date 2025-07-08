import 'package:hidroly/data/database/database_helper.dart';
import 'package:hidroly/data/datasource/custom_cups_local_datasource_impl.dart';
import 'package:hidroly/data/datasource/day_local_datasource_impl.dart';
import 'package:hidroly/data/repository/custom_cups_repository.dart';
import 'package:hidroly/data/repository/day_repository.dart';
import 'package:hidroly/provider/custom_cups_provider.dart';
import 'package:hidroly/provider/day_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final class Providers {
  final providers = <SingleChildWidget>[
    Provider(create: (_) => DatabaseHelper()),

    // Data Sources
    ProxyProvider<DatabaseHelper, DayLocalDataSourceImpl>(
      update: (_, db, __) => DayLocalDataSourceImpl(db)
    ),
    ProxyProvider<DatabaseHelper, CustomCupsLocalDataSourceImpl>(
      update: (_, db, __) => CustomCupsLocalDataSourceImpl(db)
    ),

    // Repositories
    ProxyProvider<DayLocalDataSourceImpl, DayRepository>(
      update: (_, datasource, __) => DayRepository(datasource)
    ),
    ProxyProvider<CustomCupsLocalDataSourceImpl, CustomCupsRepository>(
      update: (_, datasource, __) => CustomCupsRepository(datasource)
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
  ];
}