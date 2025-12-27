// ignore_for_file: deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:person_app/const/colors.dart';
import 'package:person_app/const/common_widgets.dart';
import 'package:person_app/const/responsive.dart';

class MaintenanceView extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  const MaintenanceView({super.key, required this.image, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Responsive.height * 100,
      width: Responsive.width * 100,
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CachedNetworkImage(
              height: 180,
              width: 180,
              imageUrl: image,
              fit: BoxFit.cover,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                ),
              ),
            ),
            const SizedBox(height: 30),
            text(text: title, size: 22, color: AppColor.black.withOpacity(.6), fontWeight: FontWeight.w900),
            const SizedBox(height: 16),
            text(
              text: subtitle,
              size: 16,
              textAlign: TextAlign.center,
              color: AppColor.black.withOpacity(.4),
              fontWeight: FontWeight.w300,
            ),
          ],
        ),
      ),
    );
  }
}
