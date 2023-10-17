import 'package:elearn/interface/controllers/enrollment/enrollment_controller.dart';
import 'package:elearn/interface/controllers/enrollment/progress_controller.dart';
import 'package:elearn/interface/views/bottom_bar_tabs/enrollment_view_tabs/video_player_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/custom_widgets/fixed_constants.dart';
import '../../../../utils/custom_widgets/text_cosntants.dart';
import '../../../../utils/themes/app_theme.dart';

class ProgressView extends StatefulWidget {
  const ProgressView({super.key, required this.enrollid});
  final String enrollid;

  @override
  State<ProgressView> createState() => _ProgressViewState();
}

class _ProgressViewState extends State<ProgressView> {
  final EnrollmentController enrollmentController = Get.find();
  late ProgressController progressController;
  @override
  void initState() {
    super.initState();
    progressController = Get.put(
      ProgressController(
          enrollid: widget.enrollid,
          courseId: enrollmentController.selectedCourse.value!.id),
      tag: widget.enrollid,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size s = getSize(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(() {
            return !progressController.loading.value
                ? Column(
                    children: progressController.sections.map((section) {
                      return Column(
                        children: [
                          ExpansionTile(
                            initiallyExpanded: true,
                            leading: CircleAvatar(
                              backgroundColor: surfacePurpleColor,
                              child: Center(
                                  child: Text(
                                section.name[0],
                                style: const TextStyle(color: Colors.white),
                              )),
                            ),
                            title: CustomText.bodyText(section.name),
                            children: section.lessons.map((lesson) {
                              return ListTile(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              VideoPlayerView(lesson: lesson)));
                                },
                                style: ListTileStyle.list,
                                minVerticalPadding: 0,
                                leading: const Icon(
                                  Icons.play_arrow_rounded,
                                  color: Colors.blue,
                                ),
                                title: CustomText.smallUnderlinedText(
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(child: Obx(
                          () {
                            return SizedBox(
                              width: !progressController.loading.value
                                  ? 0
                                  : s.width * 0.8,
                              child: const LinearProgressIndicator(),
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
                                  BorderRadius.circular(medBorderRadius)),
                        ),
                        fixedVerticalSpace(5),
                        Container(
                          height: 20,
                          width: s.width * 0.8,
                          decoration: BoxDecoration(
                              color: Colors.blueGrey.shade50,
                              borderRadius:
                                  BorderRadius.circular(medBorderRadius)),
                        ),
                        fixedVerticalSpace(5),
                        Container(
                          height: 20,
                          width: s.width * 0.8,
                          decoration: BoxDecoration(
                              color: Colors.blueGrey.shade50,
                              borderRadius:
                                  BorderRadius.circular(medBorderRadius)),
                        )
                      ],
                    ),
                  );
          }),
        ),
      ),
    );
  }
}
