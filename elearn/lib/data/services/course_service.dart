import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearn/data/models/course_model.dart';
import 'package:elearn/utils/data_constants/firestore_constants.dart';

class CourseService {
  final courseCollectionRef =
      FirebaseFirestore.instance.collection(coursescollectRefName);

  final trendCourseCollectionRef =
      FirebaseFirestore.instance.collection(trendingcollectRefName);

  Future<List<Course>?> getAllCourses() async {
    List<Course> courses = [];

    var res = await courseCollectionRef.get();
    if (res.docs.isNotEmpty) {
      for (DocumentSnapshot doc in res.docs) {
        courses.add(Course.fromJson(doc));
      }
    }
    return courses;
  }

  Future<List<Course>?> getTrendingCourses() async {
    List<Course> courses = [];
    var getTrendingCIDs = await trendCourseCollectionRef.get();
    if (getTrendingCIDs.docs.isNotEmpty) {
      for (DocumentSnapshot topratedDoc in getTrendingCIDs.docs) {
        var res = await courseCollectionRef.doc(topratedDoc.id.trim()).get();

        if (res.exists) {
          courses.add(Course.fromJson(res));
        }
      }

      return courses;
    }

    return null;
  }
}
