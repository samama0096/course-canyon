import 'dart:async';

import 'package:elearn/utils/custom_widgets/text_cosntants.dart';
import 'package:elearn/utils/themes/app_theme.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../utils/custom_widgets/fixed_constants.dart';
import '../../utils/data_constants/image_paths.dart';
import '../controllers/auth/splash_controller.dart';
import 'auth/login_view.dart';
import 'auth/signup_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final SplashController splashController =
      Get.put(SplashController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    Size s = getSize(context);
    return Scaffold(
      body: Center(
          child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [purplePrimary, purplePrimary])),
        child: Stack(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(largelBorderRadius),
                    child: SizedBox(
                        height: s.height * 0.3,
                        // width: s.width * 0.8,
                        child: Hero(
                          tag: 'icon',
                          child: ColorFiltered(
                            colorFilter: ColorFilter.mode(
                              Theme.of(context).primaryColor.withOpacity(
                                  0.2), // Use your app's primary color here
                              BlendMode.srcATop,
                            ),
                            child: Lottie.asset(
                                'lib/assets/lotties/kid-laptop.json',
                                fit: BoxFit.cover),
                          ),
                        )),
                  ),
                  fixedVerticalSpace(20),
                  CustomText.boldText('Course Canyon',
                      color: Colors.white, fontSize: 25)
                ],
              ),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 100,
                child: SpinKitRipple(
                  size: 80,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
