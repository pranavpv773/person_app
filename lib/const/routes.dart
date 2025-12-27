import 'package:go_router/go_router.dart';
import 'package:person_app/screen/get_start/view/splash_view.dart';

class Routes {
  static const String initial = '/';
  static const String splashView = '/splashView';

  static final _router = GoRouter(
    initialLocation: '/',
    routes: [GoRoute(name: initial, path: initial, builder: (context, state) => const SplashView())],
  );

  static GoRouter get router => _router;
}
