import 'package:flutter/material.dart';
import 'package:hidroly/config/providers.dart';
import 'package:hidroly/l10n/app_localizations.dart';
import 'package:hidroly/pages/home_page.dart';
import 'package:hidroly/services/notification_service.dart';
import 'package:hidroly/services/notification_task_service.dart';
import 'package:hidroly/theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:workmanager/workmanager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await NotificationService().initialize();
  await Workmanager().initialize(
    callbackDispatcher
  );

  runApp(
    MultiProvider(
      providers: Providers().providers,
      child: const MainApp(),
    )
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppTheme.darkTheme,
      home: const HomePage(),
    );
  }
}

  @pragma('vm:entry-point')
  void callbackDispatcher() {
    Workmanager().executeTask((task, inputData) async {
      if(task == 'notificationTask') {
        if(inputData == null) {
          return Future.value(false);
        }

        await NotificationTaskService.executeNotificationTask(inputData);
      }
    
      return Future.value(true);
    });
  }