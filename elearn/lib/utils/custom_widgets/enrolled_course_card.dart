import 'package:cached_network_image/cached_network_image.dart';
import 'package:elearn/data/services/enrollment_service.dart';
import 'package:elearn/interface/controllers/enrollment/enrollment_controller.dart';
import 'package:elearn/interface/views/bottom_bar_tabs/enrollment_view_tabs/progress_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/course_model.dart';
import 'fixed_constants.dart';
import 'text_cosntants.dart';
import '../themes/app_theme.dart';

getEnrolledCourseCard(
    Size s, Course course, BuildContext context, Enrollment enrollment) {
  final EnrollmentController enrollmentController = Get.find();

  return SizedBox(
      width: 270,
      child: ListTile(
        onTap: () {
          enrollmentController.selectedCourse.value = course;
          Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (context) =>
                      ProgressView(enrollid: enrollment.enrollid)));
        },
        tileColor: surfacePurpleColor.withOpacity(0.2),
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(medBorderRadius)),
        leading: SizedBox(
            height: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: course.thumnail,
                fit: BoxFit.contain,
              ),
            )),
        title: CustomText.bodyText(course.title, fontSize: 14),
        subtitle: MaterialBanner(
          backgroundColor: Colors.transparent,
          content:
              CustomText.smallUnderlinedText('Continue', color: Colors.blue),
          actions: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: backgroundDullWhite),
                onPressed: () {},
                child: const Icon(Icons.play_arrow_rounded))
          ],
        ),
      ));
}
