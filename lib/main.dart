import 'package:flutter/material.dart';
import 'package:hidroly/config/providers.dart';
import 'package:hidroly/data/model/enum/settings.dart';
import 'package:hidroly/l10n/app_localizations.dart';
import 'package:hidroly/pages/home_page.dart';
import 'package:hidroly/services/notification_service.dart';
import 'package:hidroly/theme/app_theme.dart';
import 'package:hidroly/utils/app_date_utils.dart';
import 'package:provider/provider.dart';
import 'package:workmanager/workmanager.dart';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    if(task == 'notificationTask') {
      if(inputData == null) {
        print('Input data was null when trying to send notification');
        return Future.value(false);
      }

      TimeOfDay wakeUpTime = AppDateUtils.parseTime(inputData[Settings.wakeUpTime.value]);
      TimeOfDay sleepTime = AppDateUtils.parseTime(inputData[Settings.sleepTime.value]);
      TimeOfDay now = TimeOfDay.now();

      String title = inputData['title'];
      String body = inputData['body'];

      bool isOnTimeRange = now.isAfter(wakeUpTime) && now.isBefore(sleepTime);;
      if(sleepTime.hour < wakeUpTime.hour) {
        // When the time range crosses midnight, for example from 10:00 PM to 6:00 AM,
        // we check if the current time is after the wake-up time (10:00 PM)
        // or before the sleep time (6:00 AM) to cover the overnight period.
        isOnTimeRange = now.isAfter(wakeUpTime) || now.isBefore(sleepTime);
      }

      if(isOnTimeRange) {
        final notificationService = NotificationService();
        await notificationService.initialize();
        await notificationService.showNotification(
          title,
          body,
        );
      }
    }
    return Future.value(true);
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await NotificationService().initialize();
  await Workmanager().initialize(
    callbackDispatcher,
    isInDebugMode: true
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