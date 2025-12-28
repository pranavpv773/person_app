// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:person_app/const/colors.dart';
import 'package:person_app/const/common_widgets.dart';
import 'package:person_app/const/routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  initState() {
    super.initState();
    changeScreen(context);
  }

  bool checkingButton = false;
  Future<void> changeScreen(BuildContext context) async {
    // final check = await checking();
    await Future.delayed(const Duration(seconds: 4));
    // if (check) {
    context.goNamed(Routes.initial);
    // }
  }

  Future<bool> checking() async {
    checkingButton = true;
    try {
      final result = await InternetAddress.lookup('www.google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        checkingButton = false;
        return true;
      }
      checkingButton = false;
      return false;
    } on SocketException catch (_) {
      checkingButton = false;
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColor.primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: FadeInUpBig(
                child: text(
                  text: 'UserHub',
                  color: AppColor.primaryColor,
                  textAlign: TextAlign.center,
                  size: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// UserHub
