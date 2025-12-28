// ignore_for_file: deprecated_member_use

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:person_app/const/app_bar_widget.dart';
import 'package:person_app/const/colors.dart';
import 'package:person_app/const/common_widgets.dart';
import 'package:person_app/const/routes.dart';
import 'package:person_app/screen/global_section/view/widget/side_menu.dart';
import 'package:person_app/screen/profile_add/view/widgets/mobile_section_view.dart';
import 'package:person_app/screen/profile_add/view/widgets/web_or_tablet_section_view.dart';
import 'package:person_app/screen/profile_add/view_model/add_profile_notifier.dart';
import 'package:provider/provider.dart';

class ProfileAddView extends StatefulWidget {
  const ProfileAddView({super.key});

  @override
  State<ProfileAddView> createState() => _ProfileAddViewState();
}

class _ProfileAddViewState extends State<ProfileAddView> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  AddProfileNotifier? controller;

  @override
  void initState() {
    controller = context.read<AddProfileNotifier>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    // Determine device type based on breakpoints
    bool isMobile = width < 600;
    bool isTablet = width >= 600 && width < 1024;
    // bool isDesktop = width >= 1024;
    return Scaffold(
      drawer: isTablet ? SideMenu() : null,
      backgroundColor: AppColor.white,
      appBar: PreferredSize(
        preferredSize: Size(width, 60),
        child: AppBarWidget(isMobile: isMobile, isTablet: isTablet, nkey: _key),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: isMobile ? MobileSectionView(controller: controller) : WebOrTabletSectionView(controller: controller),
        ),
      ),
    );
  }
}

class ProfileEditView extends StatefulWidget {
  const ProfileEditView({super.key});

  @override
  State<ProfileEditView> createState() => _ProfileEditViewState();
}

class _ProfileEditViewState extends State<ProfileEditView> {
  AddProfileNotifier? controller;

  @override
  void initState() {
    controller = context.read<AddProfileNotifier>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    // Determine device type based on breakpoints
    bool isMobile = width < 600;
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        leading: !kIsWeb && isMobile
            ? IconButton(
                onPressed: () {
                  context.go(Routes.homeView);
                },
                icon: Icon(Icons.arrow_back_ios_new_rounded),
              )
            : null,
        title: text(
          size: 18,
          text: 'Edit Profile',
          color: AppColor.black,
          fontFamily: GoogleFonts.urbanist(fontWeight: FontWeight.bold).fontFamily,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: isMobile ? MobileSectionView(controller: controller) : WebOrTabletSectionView(controller: controller),
        ),
      ),
    );
  }
}
