import 'package:go_router/go_router.dart';
import 'package:hidroly/features/home/view/home_view.dart';
import 'package:hidroly/features/hydration/view/hydration_view.dart';
import 'package:hidroly/features/setup/ui/view/setup_view.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: '/setup', builder: (_, _) => SetupView()),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => HomeView(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(path: '/hydration', builder: (_, _) => HydrationView()),
          ],
        ),
      ],
    ),
  ]
);