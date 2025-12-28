import 'package:person_app/screen/app/global_section/view_model/bottom_main_controller.dart';
import 'package:person_app/screen/app/home/view_model/home_notifier.dart';
import 'package:person_app/screen/app/profile/view_model/profile_notifier.dart';
import 'package:person_app/screen/app/profile_add/view_model/add_profile_notifier.dart';
import 'package:person_app/screen/app/profile_detail/view_model/profile_details_notifier.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class Providers {
  final List<SingleChildWidget> providers = [
    ChangeNotifierProvider(
      create: (context) {
        return GlobalSectionNotifier();
      },
    ),
    ChangeNotifierProvider(
      create: (context) {
        return ProfileNotifier();
      },
    ),
    ChangeNotifierProvider(
      create: (context) {
        return HomeNotifier();
      },
    ),
    ChangeNotifierProvider(
      create: (context) {
        return AddProfileNotifier();
      },
    ),
    ChangeNotifierProvider(
      create: (context) {
        return ProfileDetailsNotifier();
      },
    ),
  ];
}
