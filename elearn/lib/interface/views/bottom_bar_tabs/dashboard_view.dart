import 'package:elearn/interface/controllers/auth/splash_controller.dart';
import 'package:elearn/interface/controllers/course/course_controller.dart';
import 'package:elearn/interface/controllers/course/section_controller.dart';
import 'package:elearn/utils/custom_widgets/bottom_sheet.dart';
import 'package:elearn/utils/custom_widgets/course_card.dart';
import 'package:elearn/utils/custom_widgets/fixed_constants.dart';
import 'package:elearn/utils/custom_widgets/paddings.dart';
import 'package:elearn/utils/custom_widgets/text_cosntants.dart';
import 'package:elearn/utils/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:lottie/lottie.dart';

import '../../../data/models/course_model.dart';

class DashboardView extends StatelessWidget {
  DashboardView({super.key});
  final CourseController courseController = Get.put(CourseController());

  final SplashController splashController = Get.find();

  @override
  Widget build(BuildContext context) {
    Size s = getSize(context);
    return SafeArea(
      top: true,
      bottom: false,
      child: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: AppPaddings.mediumPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                fixedVerticalSpace(20),
                Center(
                  child: Container(
                    height: s.height * 0.2,
                    width: s.width * 0.9,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(medBorderRadius),
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.white,
                              backgroundDullWhite,
                            ])),
                    child: Stack(children: [
                      Hero(
                        tag: 'kid',
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: SizedBox(
                            height: s.height * 0.15,
                            child: Lottie.asset(
                                'lib/assets/lotties/kid-laptop.json',
                                reverse: true),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText.boldText('👋'),
                          CustomText.boldText(
                              'Hi ${splashController.user.value?.fname} !',
                              color: purplePrimary),
                          CustomText.normalText('Good evening....')
                        ],
                      )
                    ]),
                  ),
                ),
                fixedVerticalSpace(10),
                Divider(
                  endIndent: s.width * 0.1,
                  indent: s.width * 0.1,
                ),
                fixedVerticalSpace(10),
                Center(child: Obx(
                  () {
                    return SizedBox(
                      width: !courseController.coursesloading.value
                          ? 0
                          : s.width * 0.9,
                      child: const LinearProgressIndicator(),
                    );
                  },
                )),
                fixedVerticalSpace(10),
                SizedBox(
                  height: 80,
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Search for a course',
                        hintStyle: TextStyle(
                            color: Colors.blueGrey.shade100, fontSize: 12),
                        suffixIcon: const Icon(
                          Icons.search,
                          color: Colors.blueGrey,
                        )),
                  ),
                ),
                fixedVerticalSpace(10),
                CustomText.boldText(
                  ' Trending Now:',
                  fontSize: 14,
                ),
                fixedVerticalSpace(10),
                Obx(() {
                  return courseController.trendingCoursesloading.value
                      ? getPlaceHolderCard()
                      : SizedBox(
                          height: 220,
                          width: s.width * 0.9,
                          child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  courseController.trendingCourses.length,
                              itemBuilder: (context, ind) {
                                Course course =
                                    courseController.trendingCourses[ind];
                                return InkWell(
                                  splashColor: surfacePurpleColor,
                                  child: getCourseCard(
                                      s,
                                      courseController.trendingCourses[ind],
                                      true),
                                  onTap: () {
                                    getBottomSheet(s, context, course);
                                  },
                                );
                              }),
                        );
                }),
                fixedVerticalSpace(10),
                CustomText.boldText(
                  ' For you:',
                  fontSize: 14,
                ),
                fixedVerticalSpace(10),
                Obx(() {
                  return courseController.coursesloading.value
                      ? getPlaceHolderCard()
                      : SizedBox(
                          height: 220,
                          width: s.width * 0.9,
                          child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: courseController.courses.length,
                              itemBuilder: (context, ind) {
                                Course course = courseController.courses[ind];
                                return InkWell(
                                  splashColor: surfacePurpleColor,
                                  child: getCourseCard(
                                      s, courseController.courses[ind], false),
                                  onTap: () {
                                    getBottomSheet(s, context, course);
                                  },
                                );
                              }),
                        );
                }),
                fixedVerticalSpace(10),
                Divider(
                  endIndent: s.width * 0.1,
                  indent: s.width * 0.1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
