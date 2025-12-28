// ignore_for_file: deprecated_member_use

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:person_app/const/colors.dart';
import 'package:person_app/const/common_widgets.dart';
import 'package:person_app/const/responsive.dart';
import 'package:person_app/const/sized_box.dart';
import 'package:person_app/screen/app/global_section/view/widget/side_menu.dart';
import 'package:person_app/screen/app/global_section/view_model/bottom_main_controller.dart';
import 'package:provider/provider.dart';

class AppMainView extends StatelessWidget {
  final Widget child;
  const AppMainView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    // Get the width of the screen
    double width = MediaQuery.of(context).size.width;

    // Determine device type based on breakpoints
    bool isMobile = width < 600;
    bool isTablet = width >= 600 && width < 1024;
    // bool isDesktop = width >= 1024;
    print("isMobile: $isMobile");
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: isMobile
          ? Consumer<GlobalSectionNotifier>(
              builder: (context, notifier, child) {
                return Container(
                  width: Responsive.width * 100,
                  padding: EdgeInsets.symmetric(horizontal: Responsive.width * 5),
                  height: Responsive.height * 8,
                  decoration: BoxDecoration(
                    // border: Border.all(color: Colors.black45),
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.white,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xffD3D1D8).withOpacity(.2),
                        blurRadius: 18,
                        spreadRadius: 12,
                        offset: const Offset(7, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: IconButton(
                          splashColor: AppColor.transparent,
                          highlightColor: AppColor.transparent,
                          hoverColor: AppColor.transparent,
                          focusColor: AppColor.transparent,
                          onPressed: () {
                            print('object');
                            notifier.onItemTapped(index: 0);
                            print('object1');
                          },
                          icon: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.dashboard,
                                size: 24,
                                color: notifier.selectedIndex == 0 ? AppColor.primaryColor : AppColor.black40,
                              ),
                              const SizeBoxV(10),
                              notifier.selectedIndex == 0
                                  ? ZoomIn(
                                      child: text(
                                        size: 12,
                                        text: 'Home',
                                        color: notifier.selectedIndex == 0 ? AppColor.primaryColor : AppColor.black,
                                        fontFamily: GoogleFonts.urbanist(fontWeight: FontWeight.w500).fontFamily,
                                      ),
                                    )
                                  : SizedBox.shrink(),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          splashColor: AppColor.transparent,
                          highlightColor: AppColor.transparent,
                          hoverColor: AppColor.transparent,
                          focusColor: AppColor.transparent,
                          onPressed: () async {
                            notifier.onItemTapped(index: 1);
                          },
                          icon: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.groups_3,
                                size: 24,
                                color: notifier.selectedIndex == 1 ? AppColor.primaryColor : AppColor.black40,
                              ),

                              notifier.selectedIndex == 1
                                  ? ZoomIn(
                                      child: text(
                                        size: 12,
                                        text: 'Users',
                                        color: notifier.selectedIndex == 1 ? AppColor.primaryColor : AppColor.black,
                                        fontFamily: GoogleFonts.urbanist(fontWeight: FontWeight.w500).fontFamily,
                                      ),
                                    )
                                  : SizedBox.shrink(),
                            ],
                          ),
                        ),
                      ),

                      Expanded(
                        child: IconButton(
                          splashColor: AppColor.transparent,
                          highlightColor: AppColor.transparent,
                          hoverColor: AppColor.transparent,
                          focusColor: AppColor.transparent,
                          onPressed: () {
                            notifier.onItemTapped(index: 2);
                          },
                          icon: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.group_add_rounded,
                                size: 24,
                                color: notifier.selectedIndex == 2 ? AppColor.primaryColor : AppColor.black40,
                              ),

                              notifier.selectedIndex == 2
                                  ? ZoomIn(
                                      child: text(
                                        size: 12,
                                        text: 'Add Person',
                                        color: notifier.selectedIndex == 2 ? AppColor.primaryColor : AppColor.black,
                                        fontFamily: GoogleFonts.urbanist(fontWeight: FontWeight.w500).fontFamily,
                                      ),
                                    )
                                  : SizedBox.shrink(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            )
          : null,
      backgroundColor: Colors.white,
      body: isMobile
          ? child
          : Consumer<GlobalSectionNotifier>(
              builder: (context, notifier, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (!isMobile && !isTablet)
                      const Expanded(
                        flex: 1,
                        // and it takes 1/6 part of the screen
                        child: SideMenu(),
                      ),

                    Expanded(
                      flex: 5,
                      child: notifier.selectedIndex == 0
                          ? notifier.bottomBarItems[0]
                          : notifier.selectedIndex == 1
                          ? notifier.bottomBarItems[1]
                          : notifier.selectedIndex == 2
                          ? notifier.bottomBarItems[2]
                          : notifier.bottomBarItems[3],
                    ),
                  ],
                );
              },
            ),
    );
  }
}
