import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:person_app/const/app_bar_widget.dart';
import 'package:person_app/const/colors.dart';
import 'package:person_app/const/common_widgets.dart';
import 'package:person_app/const/responsive.dart';
import 'package:person_app/const/sized_box.dart';
import 'package:person_app/const/svg_images.dart';
import 'package:person_app/screen/app/global_section/view/widget/side_menu.dart';
import 'package:person_app/screen/app/home/view_model/home_notifier.dart';
import 'package:person_app/screen/app/profile/view/widgets/profile_card.dart';
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
    context.read<HomeNotifier>().getUsersData(context: context);
    super.initState();
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    // Determine device type based on breakpoints
    bool isMobile = width < 600;
    bool isTablet = width >= 600 && width < 1024;
    // bool isDesktop = width >= 1024;
    return Scaffold(
      key: _key,
      drawer: isTablet ? SideMenu() : null,
      appBar: PreferredSize(
        preferredSize: Size(width, 60),
        child: AppBarWidget(isMobile: isMobile, isTablet: isTablet, nKey: _key),
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
              Consumer<HomeNotifier>(
                builder: (context, homeNotifier, child) {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final item = homeNotifier.usersList[index];
                      return Skeletonizer(
                        enabled: homeNotifier.isUserDataLoading == true,
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
                    itemCount: homeNotifier.usersList.length > 5 ? 5 : homeNotifier.usersList.length,
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
