import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:person_app/const/colors.dart';
import 'package:person_app/const/common_widgets.dart';
import 'package:person_app/const/responsive.dart';
import 'package:person_app/const/sized_box.dart';
import 'package:person_app/const/svg_images.dart';
import 'package:person_app/screen/app/profile/view/widgets/profile_card.dart';
import 'package:person_app/screen/app/profile/view_model/profile_notifier.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                text: 'All Profiles',
                color: AppColor.black,
                fontFamily: GoogleFonts.urbanist(fontWeight: FontWeight.w500).fontFamily,
              ),
              SizeBoxH(Responsive.height * 2),

              Consumer<ProfileNotifier>(
                builder: (context, profileNotifier, child) {
                  return GridView.extent(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    maxCrossAxisExtent: 300,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    children: List.generate(profileNotifier.usersList.length, (index) {
                      final item = profileNotifier.usersList[index];
                      return ProfileCard(
                        id: '',
                        imageUrl:
                            'https://ik.imagekit.io/eatplek/marketing/banners/0d23acbc534e0456e81b0d3499a4086a_4-Db6kdEQD.png',
                        name: item.name ?? '',
                        company: item.company?.name ?? '',
                        city: item.address?.city ?? '',
                        email: item.email ?? '',
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
