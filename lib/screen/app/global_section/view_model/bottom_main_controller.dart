import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:person_app/const/routes.dart';
import 'package:person_app/screen/app/home/view/home_view.dart';
import 'package:person_app/screen/app/more/view/more_view.dart';
import 'package:person_app/screen/app/profile/view/profile_view.dart';

class GlobalSectionNotifier extends ChangeNotifier {
  int selectedIndex = 0;

  List<Widget> bottomBarItems = [HomeView(), ProfileView(), MoreView(), ProfileView()];
  void onItemTapped({required int index}) {
    selectedIndex = index;
    notifyListeners();
  }

  void onWebItemTapped(int index, BuildContext context) {
    selectedIndex = index;
    notifyListeners();
    switch (index) {
      case 0:
        // context.go(Routes.homeView,extra: );
        Routes.router.routerDelegate.navigatorKey.currentContext?.go(Routes.homeView);
      // Routes.router.routeInformationProvider.go(Routes.homeView);
      // GoRouter.of(context).go(Routes.homeView);
      case 1:
        Routes.router.routerDelegate.navigatorKey.currentContext?.go(Routes.users);

      // Routes.router.routeInformationProvider.go(Routes.users);

      // GoRouter.of(context).go(Routes.users);
      case 2:
        GoRouter.of(context).go('/c');
    }
  }
}
