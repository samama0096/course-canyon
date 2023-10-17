import 'package:elearn/data/services/course_service.dart';
import 'package:elearn/utils/custom_widgets/getx_custom_widgets.dart';
import 'package:get/get.dart';

import '../../../data/models/course_model.dart';

class CourseController extends GetxController {
  CourseService courseService = CourseService();
  List<Course> courses = [];
  List<Course> trendingCourses = [];
  Rx<bool> coursesloading = Rx(false);
  Rx<bool> trendingCoursesloading = Rx(false);

  @override
  void onReady() {
    super.onReady();
    getAllCourses();
    getTrendingCourses();
  }

  Future getAllCourses() async {
    coursesloading.value = true;
    var res = await courseService.getAllCourses();
    if (res == null) {
      coursesloading.value = false;
      showError('Check your connection.');
      return;
    }

    if (res.isNotEmpty) {
      coursesloading.value = false;
      courses = res;
    }
  }

  Future getTrendingCourses() async {
    trendingCoursesloading.value = true;
    var res = await courseService.getTrendingCourses();
    if (res == null) {
      trendingCoursesloading.value = false;
      showError('Check your connection.');
      return;
    }

    if (res.isNotEmpty) {
      trendingCoursesloading.value = false;
      trendingCourses = res;
    }
  }
}
