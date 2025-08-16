import 'package:flutter/material.dart';
import 'package:hidroly/config/providers.dart';
import 'package:hidroly/l10n/app_localizations.dart';
import 'package:hidroly/pages/home_page.dart';
import 'package:hidroly/services/notification_service.dart';
import 'package:hidroly/services/notification_task_service.dart';
import 'package:hidroly/theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:workmanager/workmanager.dart';

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
  static final ValueNotifier<ThemeMode> themeNotifier =
    ValueNotifier(ThemeMode.system);
  
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (_, theme, __) {
        return MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          themeMode: theme,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          home: const HomePage(),
        );
      }
    );
  }
}