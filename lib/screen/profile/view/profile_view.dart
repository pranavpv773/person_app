import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:person_app/const/app_bar_widget.dart';
import 'package:person_app/const/app_images.dart';
import 'package:person_app/const/colors.dart';
import 'package:person_app/const/common_widgets.dart';
import 'package:person_app/const/responsive.dart';
import 'package:person_app/const/sized_box.dart';
import 'package:person_app/const/svg_images.dart';
import 'package:person_app/screen/global_section/view/widget/side_menu.dart';
import 'package:person_app/screen/profile/view/widgets/profile_card.dart';
import 'package:person_app/screen/profile/view_model/profile_notifier.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProfileNotifier>().getUsersData(context: context);
    });
    super.initState();
  }

  final GlobalKey<ScaffoldState> profilekey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    // Determine device type based on breakpoints
    bool isMobile = width < 600;
    bool isTablet = width >= 600 && width < 1024;
    // bool isDesktop = width >= 1024;
    return Scaffold(
      key: profilekey,
      backgroundColor: AppColor.white,
      drawer: isTablet ? SideMenu() : null,
      appBar: PreferredSize(
        preferredSize: Size(width, 60),
        child: AppBarWidget(isMobile: isMobile, isTablet: isTablet, nkey: profilekey),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Consumer<ProfileNotifier>(
                builder: (context, profileNotifier, child) {
                  return buildCommonTextFormField(
                    bgColor: Colors.transparent,
                    hintText: "Search Users",
                    borderColor: AppColor.black.withOpacity(.1),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.search,
                    controller: profileNotifier.searchController,
                    context: context,
                    contentPadding: EdgeInsets.symmetric(horizontal: 0),
                    onChanged: (val) {
                      print("${val}ong");
                      // if (val.trim().length >= 3) {
                      profileNotifier.searchUsers();
                      // }
                    },
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: SvgPicture.string(SvgCodes.searchSvg, width: 20, height: 20),
                    ),
                  );
                },
              ),
              SizeBoxH(Responsive.height * 2),
              text(
                size: 16,
                text: 'All Profiles',
                color: AppColor.black,
                fontFamily: GoogleFonts.urbanist(fontWeight: FontWeight.w500).fontFamily,
              ),
              SizeBoxH(Responsive.height * 2),

              Consumer<ProfileNotifier>(
                builder: (context, profileNotifier, child) {
                  return profileNotifier.isSearchEnabled
                      ? GridView.extent(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          maxCrossAxisExtent: 300,
                          childAspectRatio: kIsWeb ? 1 : Responsive.height * .099,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          children: List.generate(profileNotifier.displayUsers.length, (index) {
                            final item = profileNotifier.displayUsers[index];
                            return Skeletonizer(
                              enabled: profileNotifier.isUserDataLoading,
                              child: ProfileCard(
                                user: item,
                                id: item.id.toString(),
                                imageUrl: AppImages.profileImg,
                                name: item.name ?? '',
                                company: item.company?.name ?? '',
                                city: item.address?.city ?? '',
                                email: item.email ?? '',
                              ),
                            );
                          }),
                        )
                      : GridView.extent(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          maxCrossAxisExtent: 300,
                          childAspectRatio: kIsWeb ? 1 : Responsive.height * .099,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          children: List.generate(profileNotifier.usersList.length, (index) {
                            final item = profileNotifier.usersList[index];
                            return Skeletonizer(
                              enabled: profileNotifier.isUserDataLoading,
                              child: ProfileCard(
                                user: item,
                                id: item.id.toString(),
                                imageUrl: AppImages.profileImg,
                                name: item.name ?? '',
                                company: item.company?.name ?? '',
                                city: item.address?.city ?? '',
                                email: item.email ?? '',
                              ),
                            );
                          }),
                        );
                },
              ),
              SizeBoxH(100),
            ],
          ),
        ),
      ),
    );
  }
}
