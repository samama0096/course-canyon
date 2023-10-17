import 'package:elearn/data/models/course_model.dart';
import 'package:elearn/data/services/enrollment_service.dart';
import 'package:elearn/interface/controllers/auth/splash_controller.dart';
import 'package:elearn/utils/custom_widgets/getx_custom_widgets.dart';
import 'package:get/get.dart';

class EnrollmentController extends GetxController {
  Rx<bool> isLoading = Rx(false);
  Rx<bool> enrollAdded = Rx(false);
  Rx<Course?> selectedCourse = Rx(null);
  Rx<List<Course>> courses = Rx([]);
  List<Enrollment> enrollments = [];
  final SplashController _splashController = Get.find();
  @override
  void onInit() async {
    super.onInit();
    await getCourseEnrollments();
    getEnrollments();
  }

  final EnrollmentService _enrollmentService = EnrollmentService();
  Future addEnrollment(String courseid) async {
    isLoading.value = true;
    int? res = await _enrollmentService.addNewEnrollment(
        _splashController.user.value!.email, courseid);
    if (res == 400) {
      isLoading.value = false;
      showError("Can't enroll right now.");
      return;
    }
    if (res == 300) {
      isLoading.value = false;

      return;
    } else {
      isLoading.value = false;
      enrollAdded.value = true;
      showSuccess('Enrolled successfully.');
    }
  }

  Future getCourseEnrollments() async {
    isLoading.value = true;
    var res = await _enrollmentService
            .getUserEnrollmentsCourses(_splashController.user.value!.email) ??
        [];

    if (res == []) {
      isLoading.value = false;
      //    showError("Can't enroll right now.");
      return;
    }
    if (res.isNotEmpty) {
      isLoading.value = false;
      courses.value = res;

      return;
    }
    isLoading.value = false;
  }

  Future getEnrollments() async {
    isLoading.value = true;
    var res = await _enrollmentService
            .getUserEnrollments(_splashController.user.value!.email) ??
        [];

    if (res == []) {
      isLoading.value = false;
      //    showError("Can't enroll right now.");
      return;
    }
    if (res.isNotEmpty) {
      isLoading.value = false;
      enrollments = res;

      return;
    }
    isLoading.value = false;
  }
}
