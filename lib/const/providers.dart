import 'package:person_app/screen/app/global_section/view_model/bottom_main_controller.dart';
import 'package:person_app/screen/app/profile/view_model/profile_notifier.dart';
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
  ];
}
