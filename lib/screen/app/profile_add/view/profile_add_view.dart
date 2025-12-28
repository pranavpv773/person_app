import 'package:flutter/material.dart';
import 'package:person_app/const/app_bar_widget.dart';
import 'package:person_app/const/colors.dart';

class ProfileAddView extends StatefulWidget {
  const ProfileAddView({super.key});

  @override
  State<ProfileAddView> createState() => _ProfileAddViewState();
}

class _ProfileAddViewState extends State<ProfileAddView> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    // Determine device type based on breakpoints
    bool isMobile = width < 600;
    bool isTablet = width >= 600 && width < 1024;
    // bool isDesktop = width >= 1024;
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: PreferredSize(
        preferredSize: Size(width, 60),
        child: AppBarWidget(isMobile: isMobile, isTablet: isTablet, nKey: _key),
      ),
    );
  }
}
