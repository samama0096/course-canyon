import 'package:cloud_firestore/cloud_firestore.dart';

class ProgressService {
  Future saveProgress(LessonProgress lessonProgress, String enrollid) async {
    var ref = FirebaseFirestore.instance
        .collection('enrollments')
        .doc(enrollid.trim())
        .collection('progress')
        .doc(lessonProgress.lessonid.trim());
    var res1 = await ref.get();
    if (res1.exists) {
      ref.update(LessonProgress.toJson(lessonProgress));
      return;
    }
  }

  Future<List<LessonProgress>> getEnrollmentProgress(String enrollid) async {
    List<LessonProgress>? lessonProgressList = [];
    var res1 = await FirebaseFirestore.instance
        .collection('enrollments')
        .doc(enrollid.trim())
        .collection('progress')
        .get();
    if (res1.docs.isNotEmpty) {
      for (DocumentSnapshot document in res1.docs) {
        lessonProgressList.add(
            LessonProgress.fromJson(document.data() as Map<String, dynamic>));
      }
    }
    return lessonProgressList;
  }
}

class LessonProgress {
  final String lessonid;
  final String time;

  LessonProgress({required this.lessonid, required this.time});
  static LessonProgress fromJson(Map<String, dynamic> json) =>
      LessonProgress(lessonid: json['lessonid'], time: json['time']);

  static Map<String, dynamic> toJson(LessonProgress lessonProgress) => {
        'lessonid': lessonProgress.lessonid,
        'time': lessonProgress.time,
      };
}
