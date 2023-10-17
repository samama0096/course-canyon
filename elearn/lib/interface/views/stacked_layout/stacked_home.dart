import 'dart:math';

import 'package:elearn/interface/controllers/auth/splash_controller.dart';
import 'package:elearn/interface/views/bottom_bar_tabs/profile_view.dart';
import 'package:elearn/interface/views/bottom_bar_tabs/enrollments_view.dart';
import 'package:elearn/interface/views/stacked_layout/custom_drawer.dart';
import 'package:elearn/utils/custom_widgets/fixed_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../utils/themes/app_theme.dart';
import '../bottom_bar_tabs/dashboard_view.dart';

class StackedHomePage extends StatefulWidget {
  const StackedHomePage({super.key});

  @override
  State<StackedHomePage> createState() => _StackedHomePageState();
}

class _StackedHomePageState extends State<StackedHomePage> {
  double tranx = 0, trany = 0, scale = 1.0;
  bool isDrawerOpened = false;
  int _current = 0;
  final SplashController splashController = Get.find<SplashController>();
  List<Widget> tabs = [
    DashboardView(),
    EnrollmentsView(),
    const ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    Size s = getSize(context);
    return Material(
      child: SafeArea(
        child: Stack(
          children: [
            AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: isDrawerOpened ? 1 : 0.4,
                child: SizedBox(height: s.height, child: const CustomDrawer())),
            AnimatedOpacity(
              duration: const Duration(seconds: 1),
              opacity: isDrawerOpened ? 0.9 : 1,
              child: AnimatedContainer(
                  clipBehavior: isDrawerOpened ? Clip.hardEdge : Clip.none,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease,
                  transform: Matrix4.translationValues(tranx, trany, 0)
                    ..scale(scale),
                  child: Scaffold(
                    // floatingActionButton: FloatingActionButton(onPressed: () {
                    //   final SplashController splashController = Get.find();
                    //   print(splashController.user.value?.email);
                    // }),
                    body: tabs[_current],
                    bottomNavigationBar: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.symmetric(
                                horizontal: BorderSide(
                                    width: 2, color: backgroundDullWhite))
                            // gradient: LinearGradient(
                            //     begin: Alignment.topLeft,
                            //     end: Alignment.bottomRight,
                            //     colors: [purplePrimary, purplePrimary]),
                            // borderRadius: BorderRadius.circular(15)),
                            ),
                        child: GNav(
                          style: GnavStyle.google,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          activeColor: purplePrimary,
                          color: Colors.blueGrey.shade200,
                          iconSize: 35,
                          gap: 5,
                          // tabActiveBorder: Border.all(
                          //   color: Colors.white,
                          // ),
                          tabBorderRadius: 10,
                          padding: const EdgeInsets.all(8),
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,

                          tabs: const [
                            GButton(
                              icon: Icons.home_rounded,
                              text: '',
                            ),
                            GButton(
                              icon: Icons.ondemand_video_rounded,
                              text: '',
                            ),
                            GButton(
                              icon: Icons.settings_rounded,
                              text: '',
                            ),
                          ],
                          selectedIndex: _current,
                          onTabChange: (index) {
                            setState(() {
                              _current = index;
                            });
                          },
                        )),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimatedOpacity(
                opacity: isDrawerOpened ? 0.8 : 1,
                duration: const Duration(milliseconds: 300),
                child: AnimatedAlign(
                  duration: const Duration(milliseconds: 300),
                  alignment:
                      isDrawerOpened ? Alignment.topLeft : Alignment.topLeft,
                  child: CircleAvatar(
                    backgroundColor: purplePrimary,
                    child: !isDrawerOpened
                        ? IconButton(
                            icon: const Icon(
                              Icons.menu,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              tranx = s.width - s.width * 0.5;
                              trany = 100;
                              scale = 1;
                              isDrawerOpened = true;
                              setState(() {});
                            },
                          )
                        : IconButton(
                            onPressed: () {
                              setState(() {
                                tranx = 0.0;
                                trany = 0.0;
                                scale = 1.0;
                                isDrawerOpened = false;
                                setState(() {});
                              });
                            },
                            icon: const Icon(
                              Icons.close,
                              color: Colors.white,
                            )),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
