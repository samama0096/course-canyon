import 'package:elearn/data/models/section_model.dart.dart';
import 'package:elearn/data/services/progress_service.dart';
import 'package:elearn/data/services/section_service.dart';
import 'package:elearn/utils/custom_widgets/getx_custom_widgets.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ProgressController extends GetxController {
  Rx<bool> loading = Rx(false);
  Rx<bool> loaded = Rx(false);
  List<Section> sections = [];

  List<LessonProgress> lessonProgress = [];
  final String courseId;
  final String enrollid;

  final SectionService _sectionService = SectionService();
  final ProgressService progressService = ProgressService();

  ProgressController({required this.enrollid, required this.courseId});
  @override
  void onReady() async {
    super.onReady();
    await getEnrolledCourseSections();
    await getEnrollmentProgress();
  }

  Future saveProgress() async {}

  Future getEnrolledCourseSections() async {
    loading.value = true;
    var res = await _sectionService.getCourseSection(id: courseId);

    if (res == null) {
      showError('Check your internet connection');
      loading.value = false;
      return;
    }
    if (res.isNotEmpty) {
      sections = res;

      loading.value = false;
    }
  }

  Future getEnrollmentProgress() async {
    loading.value = true;
    lessonProgress = await progressService.getEnrollmentProgress(enrollid);
    print(lessonProgress.length);
    loaded.value = true;
    loading.value = false;
  }
}
