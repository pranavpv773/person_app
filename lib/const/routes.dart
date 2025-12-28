import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:person_app/screen/app/global_section/view/app_main_view.dart';
import 'package:person_app/screen/app/home/view/home_view.dart';
import 'package:person_app/screen/app/profile/view/profile_view.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

class Routes {
  static const String initial = '/';
  static const String splashView = '/splash';
  static const String homeView = '/home';
  static const String users = '/users';

  static final _router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: homeView,
    routes: <RouteBase>[
      // GoRoute(
      //   name: initial,
      //   path: initial,
      //   builder: (context, state) => AppMainView(child: Container()),
      // ),
      ShellRoute(
        navigatorKey: shellNavigatorKey,
        parentNavigatorKey: rootNavigatorKey,
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return AppMainView(child: child);
        },
        routes: [
          GoRoute(name: homeView, path: homeView, builder: (context, state) => const HomeView()),
          GoRoute(path: users, builder: (context, state) => ProfileView()),
        ],
      ),
      // GoRoute(name: appGlobalView, path: appGlobalView, builder: (context, state) => const AppMainView()),
      // GoRoute(name: homeView, path: homeView, builder: (context, state) => const HomeView()),
    ],
  );

  static GoRouter get router => _router;

  void pushReplacement(String location, {Object? extra}) {
    _router.routeInformationParser
        .parseRouteInformationWithDependencies(
          RouteInformation(location: location, state: extra),
          // TODO(chunhtai): avoid accessing the context directly through global key.
          // https://github.com/flutter/flutter/issues/99112
          _router.routerDelegate.navigatorKey.currentContext!,
        )
        .then<void>((RouteMatchList matchList) {
          _router.routerDelegate.setNewRoutePath(matchList);
        });
  }
}
