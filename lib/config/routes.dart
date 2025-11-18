import 'package:go_router/go_router.dart';
import 'package:hidroly/ui/home/view/home_screen.dart';
import 'package:hidroly/ui/home/view_models/home_view_model.dart';
import 'package:hidroly/ui/setup/view/setup_screen.dart';
import 'package:hidroly/ui/setup/view_models/setup_view_model.dart';
import 'package:provider/provider.dart';

class Routes {
  static final routes = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, _) {
          return HomeScreen(
            viewModel: HomeViewModel(
              dayProvider: context.read(), 
              settingsProvider: context.read(),
            ),
          );
        },
      ),
      GoRoute(
        path: '/setup',
        builder: (context, _) {
          return SetupScreen(
            viewModel: SetupViewModel(
              dayProvider: context.read(), 
              customCupsProvider: context.read(), 
              settingsProvider: context.read(),
            ),
          );
        }
      ),
    ]
  );
}