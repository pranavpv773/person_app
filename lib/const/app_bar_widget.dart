import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:person_app/const/app_images.dart';
import 'package:person_app/const/colors.dart';
import 'package:person_app/const/common_widgets.dart';
import 'package:person_app/const/sized_box.dart';
import 'package:person_app/const/svg_images.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.isMobile, required this.isTablet, required this.nkey});

  final bool isMobile;
  final bool isTablet;
  final GlobalKey<ScaffoldState> nkey;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: AppColor.transparent,
      foregroundColor: AppColor.transparent,
      surfaceTintColor: AppColor.transparent,
      actionsPadding: EdgeInsets.symmetric(horizontal: 16),
      centerTitle: false,
      leadingWidth: 50,
      backgroundColor: AppColor.primaryColor.withOpacity(.1),
      leading: isMobile || isTablet
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  nkey.currentState!.openDrawer();
                },
                child: assetImageWidget(image: AppImages.logo),
              ),
            )
          : null,
      title: isMobile || isTablet
          ? text(
              size: 18,
              text: 'UserHub',
              color: AppColor.primaryColor,
              fontFamily: GoogleFonts.urbanist(fontWeight: FontWeight.bold).fontFamily,
            )
          : null,
      actions: [
        SvgPicture.asset(SvgCodes.notificationSvg),
        SizeBoxV(20),
        CircleAvatar(radius: 18, backgroundImage: NetworkImage(AppImages.appBarProfileImg)),
      ],
    );
  }
}
