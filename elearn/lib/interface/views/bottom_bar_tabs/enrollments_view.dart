import 'package:elearn/interface/controllers/enrollment/enrollment_controller.dart';
import 'package:elearn/utils/custom_widgets/course_card.dart';
import 'package:elearn/utils/custom_widgets/enrolled_course_card.dart';
import 'package:elearn/utils/custom_widgets/fixed_constants.dart';
import 'package:elearn/utils/custom_widgets/paddings.dart';
import 'package:elearn/utils/custom_widgets/text_cosntants.dart';
import 'package:elearn/utils/themes/app_theme.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/custom_widgets/error_empty_widgets.dart';

class EnrollmentsView extends StatelessWidget {
  EnrollmentsView({super.key});
  final EnrollmentController _enrollmentController =
      Get.put(EnrollmentController());
  @override
  Widget build(BuildContext context) {
    Size s = getSize(context);
    return SafeArea(
      top: true,
      bottom: false,
      child: SizedBox(
        height: s.height,
        child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: AppPaddings.smallPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                fixedVerticalSpace(20),
                Center(
                  child: Container(
                      height: s.height * 0.2,
                      width: s.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(medBorderRadius),
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.white,
                              backgroundDullWhite,
                            ]),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomText.boldText('Recent Enrollments',
                                fontSize: 20, color: purplePrimary),
                            CustomText.boldText('& Progress  📈',
                                fontSize: 20, color: surfacePurpleColor)
                          ],
                        ),
                      )),
                ),
                fixedVerticalSpace(20),
                CustomText.boldText(
                  'My Courses:',
                  fontSize: 14,
                ),
                fixedVerticalSpace(10),
                Expanded(
                  child: _enrollmentController.courses.value.isEmpty
                      ? Center(
                          child: EmptyPlaceHolder(
                            h: s.height * 0.2,
                            w: s.width * 0.7,
                            msg: 'Not enrolled in any course yet.',
                          ),
                        )
                      : ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _enrollmentController.courses.value.length,
                          itemBuilder: (context, ind) {
                            return getEnrolledCourseCard(
                                s,
                                _enrollmentController.courses.value[ind],
                                context,
                                _enrollmentController.enrollments[ind]);
                          }),
                ),
                fixedVerticalSpace(10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<String> courses = [
  'Data-Science Bootcamp',
  'Python Web Scraping',
  'Flutter&Dart for Newbies'
];
