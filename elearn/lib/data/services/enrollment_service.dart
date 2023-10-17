import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearn/data/models/course_model.dart';

class EnrollmentService {
  Future<int> addNewEnrollment(String userid, String courseid) async {
    try {
      var check = await checkForEnrollment(userid, courseid);
      if (!check) {
        DocumentReference reference = await FirebaseFirestore.instance
            .collection('enrollments')
            .add(Enrollment.toJson(userid, courseid));
        if (reference.id.isNotEmpty) {
          return 200;
        }
      }
      return 300;
    } catch (e) {
      return 400;
    }
  }

  Future<bool> checkForEnrollment(String userid, String courseid) async {
    try {
      var res = await FirebaseFirestore.instance
          .collection('enrollments')
          .where('userid', isEqualTo: userid)
          .where('courseid', isEqualTo: courseid)
          .get();
      if (res.docs.isEmpty) {
        return false;
      }
      if (res.docs.isNotEmpty) {
        return true;
      }
    } catch (e) {
      return false;
    }

    return true;
  }

  Future<List<Course>?> getUserEnrollmentsCourses(String user) async {
    List<Enrollment>? enrollments = [];
    List<Course>? courses;
    print('object');
    try {
      enrollments = await getUserEnrollments(user);

      if (enrollments == null) {
        return null;
      } else {
        if (enrollments.isNotEmpty) {
          courses = await getEnrolledCourses(enrollments);
        }
      }
      return courses;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<Enrollment>?> getUserEnrollments(String user) async {
    List<Enrollment>? enrollments;

    try {
      final enrollResponse = await FirebaseFirestore.instance
          .collection('enrollments')
          .where('userid', isEqualTo: user)
          .get();
      print(enrollResponse.docs.length);
      if (enrollResponse.docs.isNotEmpty) {
        enrollments =
            enrollResponse.docs.map((e) => (Enrollment.fromJson(e))).toList();
      }

      return enrollments;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<Course>> getEnrolledCourses(List<Enrollment> enrolls) async {
    List<Course> courses = [];

    for (Enrollment enrollment in enrolls) {
      var res = await FirebaseFirestore.instance
          .collection('courses')
          .doc(enrollment.courseid.trim())
          .get();
      courses.add(Course.fromJson(res));
    }

    print(courses.length);
    return courses;
  }
}

class Enrollment {
  final String courseid;
  final String user;
  final String enrollid;
  final String date;
  Enrollment(
      {required this.date,
      required this.enrollid,
      required this.courseid,
      required this.user});
  static Enrollment fromJson(DocumentSnapshot json) => Enrollment(
      courseid: json['courseid'],
      user: json['userid'],
      enrollid: json.id,
      date: json['date']);

  static Map<String, dynamic> toJson(String userid, String courseid) => {
        'userid': userid,
        'courseid': courseid,
        'date': DateTime.now().toString()
      };
}
