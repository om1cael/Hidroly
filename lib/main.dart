import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hidroly/core/navigation/app_routes.dart';
import 'package:hidroly/core/providers/theme_provider.dart';
import 'package:hidroly/core/ui/themes/themes.dart';
import 'package:hidroly/infra/notifications/local_notification_service.dart';

import 'package:workmanager/workmanager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Workmanager().initialize(callbackDispatcher);

  await EasyLocalization.ensureInitialized();
  await LocalNotificationService().initialize();

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US')],
      path: 'assets/translations',
      fallbackLocale: Locale('en', 'US'),
      child: ProviderScope(
        child: const MainApp()
      ),
    )
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeProviderProvider);
    
    return themeState.when(
      data: (theme) => MaterialApp.router(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: Themes.lightTheme,
        darkTheme: Themes.darkTheme,
        themeMode: theme,
        routerConfig: ref.watch(routerProvider),
      ),
      error: (e, _) => const Center(child: Text('A fatal error happened.'),), 
      loading: () => const Center(child: CircularProgressIndicator(),),
    );
  }
}
