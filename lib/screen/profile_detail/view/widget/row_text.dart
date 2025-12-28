import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:person_app/const/colors.dart';
import 'package:person_app/const/common_widgets.dart';

class RowText extends StatelessWidget {
  final String header;
  final String title;
  const RowText({super.key, required this.header, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        text(
          size: 12,
          text: header,
          color: AppColor.black,
          fontFamily: GoogleFonts.urbanist(fontWeight: FontWeight.w400).fontFamily,
        ),
        text(
          size: 12,
          text: title,
          color: AppColor.black,
          fontFamily: GoogleFonts.urbanist(fontWeight: FontWeight.w400).fontFamily,
        ),
      ],
    );
  }
}
