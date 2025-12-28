import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:person_app/screen/app/global_section/view/app_main_view.dart';
import 'package:person_app/screen/app/home/view/home_view.dart';
import 'package:person_app/screen/app/profile/view/profile_view.dart';
import 'package:person_app/screen/app/profile_add/view/profile_add_view.dart';
import 'package:person_app/screen/app/profile_detail/view/profile_details_view.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

class Routes {
  static const String initial = '/';
  static const String splashView = '/splash';
  static const String homeView = '/home';
  static const String users = '/users';
  static const String addUser = '/add-users';
  static const String editProfile = '/edit-profile';

  static const String profileDetails = '/profile';

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
          GoRoute(path: users, builder: (context, state) => ProfileView(), routes: [
            ],
          ),

          GoRoute(path: addUser, builder: (context, state) => ProfileAddView()),
        ],
      ),
      GoRoute(path: editProfile, builder: (context, state) => ProfileEditView()),

      GoRoute(
        parentNavigatorKey: rootNavigatorKey, // name: '$profileDetails/:id',
        path: '$profileDetails/:id',
        builder: (context, state) {
          final String userId = state.pathParameters['id']!;
          return ProfileDetailsView(id: userId);
        },
      ),
      // GoRoute(name: appGlobalView, path: appGlobalView, builder: (context, state) => const AppMainView()),
      // GoRoute(name: homeView, path: homeView, builder: (context, state) => const HomeView()),
    ],
  );

  static GoRouter get router => _router;
}
