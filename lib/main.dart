import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:person_app/const/colors.dart';
import 'package:person_app/const/providers.dart';
import 'package:person_app/const/responsive.dart';
import 'package:person_app/const/routes.dart';
import 'package:person_app/firebase_options.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: Providers().providers,
      builder: (context, child) {
        return LayoutBuilder(
          builder: (context, constraints) => OrientationBuilder(
            builder: (context, orientation) {
              Responsive().init(constraints, orientation);
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                routeInformationProvider: Routes.router.routeInformationProvider,
                routeInformationParser: Routes.router.routeInformationParser,
                routerDelegate: Routes.router.routerDelegate,
                theme: ThemeData(scaffoldBackgroundColor: AppColor.white, fontFamily: GoogleFonts.asul().fontFamily),
              );
            },
          ),
        );
      },
    );
  }
}
