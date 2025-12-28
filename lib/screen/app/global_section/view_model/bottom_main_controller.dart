import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:person_app/const/routes.dart';
import 'package:person_app/screen/app/home/view/home_view.dart';
import 'package:person_app/screen/app/profile/view/profile_view.dart';
import 'package:person_app/screen/app/profile_add/view/profile_add_view.dart';

class GlobalSectionNotifier extends ChangeNotifier {
  int selectedIndex = 0;

  List<Widget> bottomBarItems = [HomeView(), ProfileView(), ProfileAddView()];
  void onItemTapped({required int index}) {
    selectedIndex = index;
    notifyListeners();
  }

  void onWebItemTapped(int index, BuildContext context) {
    selectedIndex = index;
    notifyListeners();
    switch (index) {
      case 0:
        Routes.router.routerDelegate.navigatorKey.currentContext?.go(Routes.homeView);

      case 1:
        Routes.router.routerDelegate.navigatorKey.currentContext?.go(Routes.users);

      case 2:
        GoRouter.of(context).go(Routes.addUser);
    }
  }
}
