import 'package:cached_network_image/cached_network_image.dart';
import 'package:elearn/interface/controllers/enrollment/enrollment_controller.dart';
import 'package:elearn/interface/controllers/course/section_controller.dart';
import 'package:elearn/utils/custom_widgets/backdrop_loading.dart';
import 'package:elearn/utils/custom_widgets/text_cosntants.dart';
import 'package:elearn/utils/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/course_model.dart';
import 'fixed_constants.dart';

getBottomSheet(Size s, BuildContext context, Course course) {
  final SectionController sectionController =
      Get.put(SectionController(id: course.id), tag: course.id);
  final EnrollmentController enrollmentController = Get.find();

  return showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: true,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(largelBorderRadius)),
      barrierLabel: 'drag to close',
      showDragHandle: true,
      backgroundColor: Colors.white,
      context: context,
      builder: (context) {
        return Obx(() {
          return Stack(
            children: [
              SizedBox(
                height: s.height * 0.9,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: SizedBox(
                              height: s.height * 0.3,
                              width: s.width * 0.9,
                              child: CachedNetworkImage(
                                imageUrl: course.thumnail,
                                fit: BoxFit.contain,
                              )),
                        ),
                        CustomText.boldText(course.title),
                        CustomText.smallText('Not rated yet',
                            color: Colors.grey),
                        fixedVerticalSpace(10),
                        InkWell(
                          onTap: () async {
                            if (enrollmentController.courses.value.where((c) {
                              return c.id == course.id;
                            }).isEmpty) {
                              enrollmentController.addEnrollment(course.id);
                            } else {}
                          },
                          child: Container(
                            color: Colors.white,
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        smallBorderRadius),
                                    gradient: LinearGradient(colors: [
                                      Theme.of(context).primaryColor,
                                      Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.9),
                                      Theme.of(context).primaryColor
                                    ])),
                                height: 50,
                                width: s.width * 0.9,
                                child: Center(
                                    child: CustomText.boldText(
                                        enrollmentController.courses.value
                                                .where((c) {
                                          return c.id == course.id;
                                        }).isNotEmpty
                                            ? 'View Progress'
                                            : 'Enroll for \$${course.price}',
                                        color: Colors.white))),
                          ),
                        ),
                        fixedVerticalSpace(10),
                        ListTile(
                          shape: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(medBorderRadius),
                              borderSide: BorderSide(color: purplePrimary)),
                          title:
                              CustomText.boldText(course.tutor, fontSize: 12),
                          subtitle: CustomText.smallText(course.tutorid),
                          leading: Icon(
                            Icons.person_pin,
                            size: 50,
                            color: purplePrimary,
                          ),
                        ),
                        fixedVerticalSpace(20),
                        ExpansionTile(
                          title: CustomText.boldText('What will you learn?'),
                          children: course.keylearnings.map((e) {
                            return ListTile(
                              leading: Icon(
                                Icons.done,
                                size: 25,
                                color: purplePrimary,
                              ),
                              title: CustomText.smallText(e),
                            );
                          }).toList(),
                        ),
                        fixedVerticalSpace(10),
                        ExpansionTile(
                          title: CustomText.boldText('Requirements'),
                          children: course.requirements.map((e) {
                            return ListTile(
                              leading: Icon(
                                Icons.circle,
                                size: 15,
                                color: lightOrangesecondary,
                              ),
                              title: CustomText.smallText(e),
                            );
                          }).toList(),
                        ),
                        fixedVerticalSpace(20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: CustomText.boldText('Course Sections:'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Obx(() {
                            return sectionController.loaded.value
                                ? Column(
                                    children: sectionController.sections
                                        .map((section) {
                                      return Column(
                                        children: [
                                          ExpansionTile(
                                            leading: CircleAvatar(
                                              backgroundColor:
                                                  surfacePurpleColor,
                                              child: Center(
                                                  child: Text(
                                                section.name[0],
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              )),
                                            ),
                                            title: CustomText.bodyText(
                                                section.name),
                                            children:
                                                section.lessons.map((lesson) {
                                              return ListTile(
                                                style: ListTileStyle.list,
                                                minVerticalPadding: 0,
                                                leading: const Icon(
                                                  Icons.play_arrow_rounded,
                                                  color: Colors.blue,
                                                ),
                                                title: CustomText
                                                    .smallUnderlinedText(
                                                        lesson.name,
                                                        color: Colors.blue),
                                              );
                                            }).toList(),
                                          ),
                                          const Divider()
                                        ],
                                      );
                                    }).toList(),
                                  )
                                : SizedBox(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Center(child: Obx(
                                          () {
                                            return SizedBox(
                                              width: !sectionController
                                                      .loading.value
                                                  ? 0
                                                  : s.width * 0.8,
                                              child:
                                                  const LinearProgressIndicator(),
                                            );
                                          },
                                        )),
                                        fixedVerticalSpace(20),
                                        Container(
                                          height: 40,
                                          width: s.width * 0.8,
                                          decoration: BoxDecoration(
                                              color: Colors.blueGrey.shade100,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      medBorderRadius)),
                                        ),
                                        fixedVerticalSpace(5),
                                        Container(
                                          height: 20,
                                          width: s.width * 0.8,
                                          decoration: BoxDecoration(
                                              color: Colors.blueGrey.shade50,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      medBorderRadius)),
                                        ),
                                        fixedVerticalSpace(5),
                                        Container(
                                          height: 20,
                                          width: s.width * 0.8,
                                          decoration: BoxDecoration(
                                              color: Colors.blueGrey.shade50,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      medBorderRadius)),
                                        )
                                      ],
                                    ),
                                  );
                          }),
                        ),
                        fixedVerticalSpace(20),
                      ],
                    ),
                  ),
                ),
              ),
              Obx(
                () => Visibility(
                    visible: enrollmentController.isLoading.value,
                    child: Positioned.fill(
                        child: getBackDrop(
                            'Getting enrolled, please wait.', s.width * 0.7))),
              )
            ],
          );
        });
      });
}
