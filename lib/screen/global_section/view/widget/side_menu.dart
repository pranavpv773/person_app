import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:person_app/const/app_images.dart';
import 'package:person_app/const/colors.dart';
import 'package:person_app/const/common_widgets.dart';
import 'package:person_app/screen/global_section/view_model/bottom_main_controller.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    // Determine device type based on breakpoints
    // bool isMobile = width < 600;
    bool isTablet = width >= 600 && width < 1024;
    // bool isDesktop = width >= 1024;
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topRight: Radius.circular(0), bottomRight: Radius.circular(0)),
      ),
      backgroundColor: isTablet ? AppColor.white : AppColor.primaryColor.withOpacity(.1),
      child: Consumer<GlobalSectionNotifier>(
        builder: (context, notifier, child) {
          return ListView(
            children: [
              SizedBox(
                height: 60,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: assetImageWidget(image: AppImages.logo),
                    ),
                    text(
                      size: 18,
                      text: 'UserHub',
                      color: AppColor.primaryColor,
                      fontFamily: GoogleFonts.urbanist(fontWeight: FontWeight.bold).fontFamily,
                    ),
                  ],
                ),
              ),
              DrawerListTile(
                isSelected: notifier.selectedIndex == 0,
                title: "Home",
                svgSrc: Icons.dashboard,
                press: () {
                  notifier.onWebItemTapped(0, context);
                },
              ),
              DrawerListTile(
                isSelected: notifier.selectedIndex == 1,
                title: "Profile",
                svgSrc: Icons.group_add_rounded,
                press: () {
                  notifier.onWebItemTapped(1, context);
                },
              ),
              DrawerListTile(
                isSelected: notifier.selectedIndex == 2,
                title: "Add Person",
                svgSrc: Icons.groups_3,
                press: () {
                  notifier.onWebItemTapped(2, context);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final bool isSelected;
  const DrawerListTile({
    super.key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
    required this.isSelected,
  });

  final String title;
  final IconData svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 10.0,
      leading: Icon(svgSrc, color: isSelected ? AppColor.primaryColor : Colors.black, size: 16),
      title: Text(title, style: TextStyle(color: isSelected ? AppColor.primaryColor : Colors.black)),
    );
  }
}
