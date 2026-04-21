import 'package:go_router/go_router.dart';
import 'package:hidroly/core/data/repositories/day_repository_impl.dart';
import 'package:hidroly/features/home/ui/view/home_view.dart';
import 'package:hidroly/features/hydration/ui/view/hydration_view.dart';
import 'package:hidroly/features/migration/data/repositories/migration_repository_impl.dart';
import 'package:hidroly/features/migration/ui/view/migration_view.dart';
import 'package:hidroly/features/settings/ui/view/settings_reminder_view.dart';
import 'package:hidroly/features/settings/ui/view/settings_view.dart';
import 'package:hidroly/features/setup/ui/view/setup_view.dart';
import 'package:hidroly/features/summary/ui/view/summary_view.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_routes.g.dart';

@riverpod
GoRouter router(Ref ref) {
  final dayRepository = ref.watch(dayRepositoryProvider);

  return GoRouter(
    redirect: (context, state) async {
      final dayList = await dayRepository.readAll();
      final isMigrationNeeded = await ref.read(migrationRepositoryProvider).getOldDatabase() != null;
      final setupCompleted = dayList.isNotEmpty;

      if(isMigrationNeeded && !setupCompleted && state.matchedLocation != '/migration') {
        return '/migration';
      }

      if(!setupCompleted && state.matchedLocation != '/setup') {
        return '/setup';
      }

      if(setupCompleted && state.matchedLocation == '/setup') {
        return '/';
      }

      return null;
    },
    routes: [
      GoRoute(path: '/setup', builder: (_, _) => SetupView()),
      GoRoute(path: '/settings', builder: (_, _) => SettingsView()),
      GoRoute(path: '/settings/notifications', builder: (_, _) => SettingsReminderView()),
      GoRoute(path: '/migration', builder: (_, _) => MigrationView()),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => HomeView(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(path: '/', builder: (_, _) => HydrationView()),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(path: '/summary', builder: (_, _) => SummaryView()),
            ],
          ),
        ],
      )
    ]
  );
}