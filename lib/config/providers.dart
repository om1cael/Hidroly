import 'package:hidroly/data/database/database_helper.dart';
import 'package:hidroly/data/datasource/custom_cups_local_datasource_impl.dart';
import 'package:hidroly/data/datasource/user_local_datasource_impl.dart';
import 'package:hidroly/data/repository/custom_cups_repository.dart';
import 'package:hidroly/data/repository/user_repository.dart';
import 'package:hidroly/provider/custom_cups_provider.dart';
import 'package:hidroly/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final class Providers {
  final providers = <SingleChildWidget>[
    Provider(create: (_) => DatabaseHelper()),

    // Data Sources
    ProxyProvider<DatabaseHelper, UserLocalDataSourceImpl>(
      update: (_, db, __) => UserLocalDataSourceImpl(db)
    ),
    ProxyProvider<DatabaseHelper, CustomCupsLocalDataSourceImpl>(
      update: (_, db, __) => CustomCupsLocalDataSourceImpl(db)
    ),

    // Repositories
    ProxyProvider<UserLocalDataSourceImpl, UserRepository>(
      update: (_, datasource, __) => UserRepository(datasource)
    ),
    ProxyProvider<CustomCupsLocalDataSourceImpl, CustomCupsRepository>(
      update: (_, datasource, __) => CustomCupsRepository(datasource)
    ),

    // Providers
    ChangeNotifierProxyProvider<UserRepository, UserProvider>(
      create: (context) => UserProvider(), 
      update: (_, repository, provider) => provider!..setRepository(repository)
    ),
    ChangeNotifierProxyProvider<CustomCupsRepository, CustomCupsProvider>(
      create: (context) => CustomCupsProvider(), 
      update: (_, repository, provider) => provider!..setRepository(repository)
    ),
  ];
}