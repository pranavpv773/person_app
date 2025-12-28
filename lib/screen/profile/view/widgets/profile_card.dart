// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:person_app/const/colors.dart';
import 'package:person_app/const/common_widgets.dart';
import 'package:person_app/const/responsive.dart';
import 'package:person_app/const/routes.dart';
import 'package:person_app/const/sized_box.dart';
import 'package:person_app/screen/profile/model/profile_model.dart';
import 'package:person_app/screen/profile_detail/view_model/profile_details_notifier.dart';
import 'package:provider/provider.dart';

class ProfileTileCard extends StatelessWidget {
  final UserModel user;
  final String id;
  String imageUrl;
  final String name;
  final String company;
  final String email;
  final String city;

  ProfileTileCard({
    super.key,
    required this.user,
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.company,
    required this.email,
    required this.city,
  });

  @override
  Widget build(BuildContext context) {
    return ZoomIn(
      child: GestureDetector(
        onTap: () {
          context.read<ProfileDetailsNotifier>().setUserModel(user);
          context.go("${Routes.profileDetails}/$id");
        },
        child: Container(
          width: Responsive.width * 100,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColor.white,
            boxShadow: [
              BoxShadow(
                color: AppColor.primaryColor.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
            border: Border.all(color: AppColor.primaryColor.withOpacity(.1)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  image(color: AppColor.primaryColor.withOpacity(.2), url: imageUrl, height: 90, width: 72, radius: 10),
                  const SizeBoxV(12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            text(
                              size: 16,
                              maxLines: 1,
                              text: name,
                              color: AppColor.black,
                              fontFamily: GoogleFonts.urbanist(fontWeight: FontWeight.w600).fontFamily,
                            ),
                          ],
                        ),
                        const SizeBoxH(8),
                        text(
                          size: 14,
                          text: company,
                          color: AppColor.primaryColor,
                          fontFamily: GoogleFonts.urbanist(fontWeight: FontWeight.w500).fontFamily,
                        ),
                        const SizeBoxH(10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            text(
                              size: 12,
                              text: email,
                              color: AppColor.black,
                              fontFamily: GoogleFonts.urbanist(fontWeight: FontWeight.w400).fontFamily,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final UserModel user;

  final String id;
  String imageUrl;
  final String name;
  final String company;
  final String email;
  final String city;

  ProfileCard({
    super.key,
    required this.user,
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.company,
    required this.email,
    required this.city,
  });

  @override
  Widget build(BuildContext context) {
    return ZoomIn(
      child: GestureDetector(
        onTap: () {
          context.read<ProfileDetailsNotifier>().setUserModel(user);
          context.go("${Routes.profileDetails}/$id");
        },
        child: Container(
          width: Responsive.width * 40,
          // padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 9),
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: AppColor.primaryColor.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
            border: Border.all(color: AppColor.primaryColor.withOpacity(.1)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              image(url: imageUrl, height: Responsive.height * 13, width: Responsive.width * 100, radius: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizeBoxH(6),
                    text(
                      size: 14,
                      text: name,
                      color: AppColor.black,
                      fontFamily: GoogleFonts.urbanist(fontWeight: FontWeight.w600).fontFamily,
                    ),
                    const SizeBoxH(6),
                    text(
                      size: 11,
                      text: company,
                      color: AppColor.primaryColor,
                      fontFamily: GoogleFonts.urbanist(fontWeight: FontWeight.w400).fontFamily,
                    ),
                    const SizeBoxH(10),
                    text(
                      size: 12,
                      text: email,
                      color: AppColor.black,
                      fontFamily: GoogleFonts.urbanist(fontWeight: FontWeight.w600).fontFamily,
                    ),
                    const SizeBoxH(10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
