import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:person_app/const/app_images.dart';
import 'package:person_app/const/colors.dart';
import 'package:person_app/const/common_widgets.dart';
import 'package:person_app/const/responsive.dart';
import 'package:person_app/const/sized_box.dart';
import 'package:person_app/const/svg_images.dart';
import 'package:person_app/screen/app/profile/view/widgets/profile_card.dart';
import 'package:person_app/screen/app/profile/view_model/profile_notifier.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    context.read<ProfileNotifier>().getUsersData(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    // Determine device type based on breakpoints
    bool isMobile = width < 600;
    // bool isTablet = width >= 600 && width < 1024;
    // bool isDesktop = width >= 1024;
    return Scaffold(
      appBar: AppBar(
        shadowColor: AppColor.transparent,
        foregroundColor: AppColor.transparent,
        surfaceTintColor: AppColor.transparent,
        actionsPadding: EdgeInsets.symmetric(horizontal: 16),
        centerTitle: false,
        leadingWidth: 50,
        backgroundColor: AppColor.primaryColor.withOpacity(.1),
        leading: isMobile
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: assetImageWidget(image: AppImages.logo),
              )
            : null,
        title: isMobile
            ? text(
                size: 18,
                text: 'UserHub',
                color: AppColor.primaryColor,
                fontFamily: GoogleFonts.urbanist(fontWeight: FontWeight.bold).fontFamily,
              )
            : null,
        actions: [
          SvgPicture.asset('assets/images/notification-bing-svgrepo-com.svg'),
          SizeBoxV(20),
          CircleAvatar(
            radius: 18,
            backgroundImage: NetworkImage(
              'https://ik.imagekit.io/eatplek/marketing/banners/0d23acbc534e0456e81b0d3499a4086a_4-Db6kdEQD.png',
            ),
          ),
        ],
      ),
      backgroundColor: AppColor.white,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildCommonTextFormField(
                bgColor: Colors.transparent,
                hintText: "Search Users",
                borderColor: AppColor.black.withOpacity(.1),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.search,
                controller: TextEditingController(),
                context: context,
                contentPadding: EdgeInsets.symmetric(horizontal: 0),
                onChanged: (p0) {},
                prefixIcon: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: SvgPicture.string(SvgCodes.searchSvg, width: 20, height: 20),
                ),
              ),
              SizeBoxH(Responsive.height * 2),
              text(
                size: 16,
                text: 'Top 5 Profile',
                color: AppColor.black,
                fontFamily: GoogleFonts.urbanist(fontWeight: FontWeight.w500).fontFamily,
              ),
              SizeBoxH(Responsive.height * 2),
              Consumer<ProfileNotifier>(
                builder: (context, profileNotifier, child) {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final item = profileNotifier.usersList[index];
                      return Skeletonizer(
                        enabled: profileNotifier.isUserDataLoading == true,
                        child: ProfileTileCard(
                          id: '',
                          imageUrl:
                              'https://ik.imagekit.io/eatplek/marketing/banners/0d23acbc534e0456e81b0d3499a4086a_4-Db6kdEQD.png',
                          name: item.name ?? '',
                          company: item.company?.name ?? '',
                          city: item.address?.city ?? '',
                          email: item.email ?? '',
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const SizeBoxH(16),
                    itemCount: profileNotifier.usersList.length > 5 ? 5 : profileNotifier.usersList.length,
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
