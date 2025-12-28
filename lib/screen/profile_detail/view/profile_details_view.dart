// ignore_for_file: deprecated_member_use
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:person_app/const/app_images.dart';
import 'package:person_app/const/colors.dart';
import 'package:person_app/const/common_widgets.dart';
import 'package:person_app/const/responsive.dart';
import 'package:person_app/const/routes.dart';
import 'package:person_app/const/sized_box.dart';
import 'package:person_app/screen/profile_add/view_model/add_profile_notifier.dart';
import 'package:person_app/screen/profile_detail/view/widget/location_view.dart';
import 'package:person_app/screen/profile_detail/view/widget/row_text.dart';
import 'package:person_app/screen/profile_detail/view_model/profile_details_notifier.dart';
import 'package:provider/provider.dart';

class ProfileDetailsView extends StatelessWidget {
  final String id;
  const ProfileDetailsView({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isMobile = width < 600;
    return Scaffold(
      appBar: AppBar(
        shadowColor: AppColor.transparent,
        foregroundColor: AppColor.transparent,
        surfaceTintColor: AppColor.transparent,
        leading: kIsWeb == false && isMobile
            ? IconButton(
                onPressed: () {
                  context.go(Routes.homeView);
                },
                icon: Icon(Icons.arrow_back_ios_new_rounded, color: AppColor.black),
              )
            : null,
        title: Consumer<ProfileDetailsNotifier>(
          builder: (context, notifier, child) {
            return text(
              size: 18,
              text: notifier.user.name,
              color: AppColor.black,
              fontFamily: GoogleFonts.urbanist(fontWeight: FontWeight.bold).fontFamily,
            );
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {
                context.read<AddProfileNotifier>().setProfileUpdate(context.read<ProfileDetailsNotifier>().user);
                context.go(Routes.editProfile);
              },
              icon: Icon(Icons.mode_edit_outline_outlined, color: AppColor.black),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<ProfileDetailsNotifier>(
          builder: (context, notifier, child) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      boxShadow: [
                        BoxShadow(
                          color: AppColor.primaryColor.withOpacity(.2),
                          blurRadius: 6,
                          spreadRadius: 1,
                          offset: const Offset(0, 2),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColor.primaryColor.withOpacity(.1)),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: Responsive.width * 30,
                          width: 120,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            image: DecorationImage(image: NetworkImage(AppImages.profileImg), fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(16),
                            color: const Color(0xff2773FF).withOpacity(.2),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.2),
                                blurRadius: 6,
                                spreadRadius: -4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                        ),
                        const SizeBoxV(10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            text(
                              size: 16,
                              text: notifier.user.name,
                              color: AppColor.black,
                              fontFamily: GoogleFonts.urbanist(fontWeight: FontWeight.w600).fontFamily,
                            ),
                            const SizeBoxH(10),
                            text(
                              size: 12,
                              text: notifier.user.username,
                              color: AppColor.black,
                              fontFamily: GoogleFonts.urbanist(fontWeight: FontWeight.w400).fontFamily,
                            ),
                            const SizeBoxH(10),
                            text(
                              size: 12,
                              text: notifier.user.phone,
                              color: AppColor.black,
                              fontFamily: GoogleFonts.urbanist(fontWeight: FontWeight.w400).fontFamily,
                            ),
                            const SizeBoxH(10),
                            text(
                              size: 12,
                              text: notifier.user.email,
                              color: AppColor.black,
                              fontFamily: GoogleFonts.urbanist(fontWeight: FontWeight.w400).fontFamily,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizeBoxH(20),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      boxShadow: [
                        BoxShadow(
                          color: AppColor.primaryColor.withOpacity(.2),
                          blurRadius: 6,
                          spreadRadius: 1,
                          offset: const Offset(0, 2),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColor.primaryColor.withOpacity(.1)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          text(
                            size: 16,
                            text: 'Address',
                            color: AppColor.black,
                            fontFamily: GoogleFonts.urbanist(fontWeight: FontWeight.w600).fontFamily,
                          ),
                          const SizeBoxH(10),
                          RowText(header: 'Suite', title: notifier.user.address?.suite ?? ''),
                          const SizeBoxH(10),
                          RowText(header: 'City', title: notifier.user.address?.city ?? ''),
                          const SizeBoxH(10),
                          RowText(header: 'Street', title: notifier.user.address?.street ?? ''),
                          const SizeBoxH(10),
                          RowText(header: 'Zipcode', title: notifier.user.address?.zipcode ?? ''),
                          const SizeBoxH(10),
                          LocationMapSection(
                            latitude: double.parse(notifier.user.address?.geo?.lat ?? '0'),
                            longitude: double.parse(notifier.user.address?.geo?.lng ?? '0'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizeBoxH(20),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      boxShadow: [
                        BoxShadow(
                          color: AppColor.primaryColor.withOpacity(.2),
                          blurRadius: 6,
                          spreadRadius: 1,
                          offset: const Offset(0, 2),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColor.primaryColor.withOpacity(.1)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          text(
                            size: 16,
                            text: 'Company',
                            color: AppColor.black,
                            fontFamily: GoogleFonts.urbanist(fontWeight: FontWeight.w600).fontFamily,
                          ),
                          const SizeBoxH(10),
                          RowText(header: 'Name', title: notifier.user.company?.name ?? ''),
                          const SizeBoxH(10),
                          RowText(header: 'Catch Phrase', title: notifier.user.company?.catchPhrase ?? ''),
                          const SizeBoxH(10),
                          RowText(header: 'Bs', title: notifier.user.company?.bs ?? ''),
                          const SizeBoxH(10),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
