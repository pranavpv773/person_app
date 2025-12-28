// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:person_app/const/colors.dart';
import 'package:person_app/const/common_widgets.dart';
import 'package:person_app/const/responsive.dart';
import 'package:person_app/const/sized_box.dart';
import 'package:person_app/screen/profile_add/view_model/add_profile_notifier.dart';

class WebOrTabletSectionView extends StatelessWidget {
  const WebOrTabletSectionView({super.key, required this.controller});

  final AddProfileNotifier? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  text(
                    size: 14,
                    text: 'Profile Name',
                    color: AppColor.textGrey,
                    fontFamily: GoogleFonts.urbanist(fontWeight: FontWeight.w500).fontFamily,
                  ),
                  SizeBoxH(Responsive.height * 1),
                  buildCommonTextFormField(
                    bgColor: Colors.transparent,
                    hintText: "Enter your Name",
                    borderColor: AppColor.black.withOpacity(.1),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    controller: controller?.nameController,
                    context: context,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    onChanged: (p0) {},
                  ),
                ],
              ),
            ),
            SizeBoxV(Responsive.width * 2),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  text(
                    size: 14,
                    text: 'User Name',
                    color: AppColor.textGrey,
                    fontFamily: GoogleFonts.urbanist(fontWeight: FontWeight.w500).fontFamily,
                  ),
                  SizeBoxH(Responsive.height * 1),
                  buildCommonTextFormField(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    bgColor: Colors.transparent,
                    hintText: "Enter your user Name",
                    borderColor: AppColor.black.withOpacity(.1),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    controller: controller?.userNameController,
                    context: context,
                    onChanged: (p0) {},
                  ),
                ],
              ),
            ),
          ],
        ),
        SizeBoxH(Responsive.height * 2),
        /* 2 */
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  text(
                    size: 14,
                    text: 'User Email',
                    color: AppColor.textGrey,
                    fontFamily: GoogleFonts.urbanist(fontWeight: FontWeight.w500).fontFamily,
                  ),
                  SizeBoxH(Responsive.height * 1),
                  buildCommonTextFormField(
                    bgColor: Colors.transparent,
                    hintText: "Enter your Email",
                    borderColor: AppColor.black.withOpacity(.1),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    controller: controller?.emailController,
                    context: context,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    onChanged: (p0) {},
                  ),
                ],
              ),
            ),
            SizeBoxV(Responsive.width * 2),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  text(
                    size: 14,
                    text: 'Phone',
                    color: AppColor.textGrey,
                    fontFamily: GoogleFonts.urbanist(fontWeight: FontWeight.w500).fontFamily,
                  ),
                  SizeBoxH(Responsive.height * 1),
                  buildCommonTextFormField(
                    bgColor: Colors.transparent,
                    hintText: "Enter Phone number",
                    borderColor: AppColor.black.withOpacity(.1),
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    controller: controller?.phoneController,
                    context: context,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    onChanged: (p0) {},
                  ),
                ],
              ),
            ),
          ],
        ),
        SizeBoxH(Responsive.height * 2),
        /* 3 */
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  text(
                    size: 14,
                    text: 'City',
                    color: AppColor.textGrey,
                    fontFamily: GoogleFonts.urbanist(fontWeight: FontWeight.w500).fontFamily,
                  ),
                  SizeBoxH(Responsive.height * 1),
                  buildCommonTextFormField(
                    bgColor: Colors.transparent,
                    hintText: "Enter your city",
                    borderColor: AppColor.black.withOpacity(.1),
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    controller: controller?.cityController,
                    context: context,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    onChanged: (p0) {},
                  ),
                ],
              ),
            ),
            SizeBoxV(Responsive.width * 2),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  text(
                    size: 14,
                    text: 'Street',
                    color: AppColor.textGrey,
                    fontFamily: GoogleFonts.urbanist(fontWeight: FontWeight.w500).fontFamily,
                  ),
                  SizeBoxH(Responsive.height * 1),
                  buildCommonTextFormField(
                    bgColor: Colors.transparent,
                    hintText: "Enter your street",
                    borderColor: AppColor.black.withOpacity(.1),
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    controller: controller?.streetController,
                    context: context,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    onChanged: (p0) {},
                  ),
                ],
              ),
            ),
          ],
        ),
        SizeBoxH(Responsive.height * 2),
        /* 4 */
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  text(
                    size: 14,
                    text: 'Zipcode',
                    color: AppColor.textGrey,
                    fontFamily: GoogleFonts.urbanist(fontWeight: FontWeight.w500).fontFamily,
                  ),
                  SizeBoxH(Responsive.height * 1),
                  buildCommonTextFormField(
                    bgColor: Colors.transparent,
                    hintText: "Enter your zipcode",
                    borderColor: AppColor.black.withOpacity(.1),
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    controller: controller?.zipCodeController,
                    context: context,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    onChanged: (p0) {},
                  ),
                ],
              ),
            ),
            SizeBoxV(Responsive.width * 2),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  text(
                    size: 14,
                    text: 'Suite',
                    color: AppColor.textGrey,
                    fontFamily: GoogleFonts.urbanist(fontWeight: FontWeight.w500).fontFamily,
                  ),
                  SizeBoxH(Responsive.height * 1),
                  buildCommonTextFormField(
                    bgColor: Colors.transparent,
                    hintText: "Enter your suite",
                    borderColor: AppColor.black.withOpacity(.1),
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    controller: controller?.suiteController,
                    context: context,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    onChanged: (p0) {},
                  ),
                ],
              ),
            ),
          ],
        ),
        SizeBoxH(Responsive.height * 2),

        /* 5 */
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  text(
                    size: 14,
                    text: 'Website',
                    color: AppColor.textGrey,
                    fontFamily: GoogleFonts.urbanist(fontWeight: FontWeight.w500).fontFamily,
                  ),
                  SizeBoxH(Responsive.height * 1),
                  buildCommonTextFormField(
                    bgColor: Colors.transparent,
                    hintText: "Enter your website",
                    borderColor: AppColor.black.withOpacity(.1),
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    controller: controller?.websiteController,
                    context: context,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    onChanged: (p0) {},
                  ),
                ],
              ),
            ),
            SizeBoxV(Responsive.width * 2),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  text(
                    size: 14,
                    text: 'Company Name',
                    color: AppColor.textGrey,
                    fontFamily: GoogleFonts.urbanist(fontWeight: FontWeight.w500).fontFamily,
                  ),
                  SizeBoxH(Responsive.height * 1),
                  buildCommonTextFormField(
                    bgColor: Colors.transparent,
                    hintText: "Enter your Company name",
                    borderColor: AppColor.black.withOpacity(.1),
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.done,
                    controller: controller?.companyNameController,
                    context: context,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    onChanged: (p0) {},
                  ),
                ],
              ),
            ),
          ],
        ),
        SizeBoxH(Responsive.height * 2),
        button(
          width: double.infinity,
          height: 50,
          onTap: () {
            controller?.addPersonFn(context);
          },
          textColor: AppColor.white,
          borderColor: AppColor.primaryColor.withOpacity(.1),
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(6),
          name: 'Add Profile',
          fontSize: 18,
        ),
      ],
    );
  }
}
