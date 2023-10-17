import 'package:elearn/interface/views/auth/login_view.dart';
import 'package:elearn/interface/views/auth/signup_view.dart';
import 'package:elearn/interface/views/bottom_bar_tabs/enrollment_view_tabs/progress_view.dart';
import 'package:elearn/interface/views/bottom_bar_tabs/profile_view.dart';
import 'package:elearn/interface/views/splash_view.dart';
import 'package:elearn/interface/views/stacked_layout/stacked_home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'utils/themes/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    builder: (BuildContext context, Widget? child) {
      final MediaQueryData data = MediaQuery.of(context);
      return MediaQuery(
        data: data.copyWith(textScaleFactor: 1.2),
        child: GetMaterialApp(
          theme: AppTheme.apptheme(),
          debugShowCheckedModeBanner: false,
          getPages: [
            GetPage(name: '/splashview', page: () => const SplashView()),
            GetPage(name: '/signupview', page: () => SignupView()),
            GetPage(
                name: '/stackedhomeview', page: () => const StackedHomePage()),
            GetPage(name: '/loginview', page: () => LoginView()),
            GetPage(name: '/profileview', page: () => const ProfileView()),
          ],
          home: const SplashView(), //  initial route to splash screen
        ),
      );
    },
    debugShowCheckedModeBanner: false,
  ));
}
