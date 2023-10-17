import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearn/data/models/section_model.dart.dart';
import 'package:flutter/material.dart';

import '../../utils/data_constants/firestore_constants.dart';

class SectionService {
  Future<List<Section>?> getCourseSection({required String id}) async {
    List<Section> sections = [];
    try {
      final sectionCollectionRef = FirebaseFirestore.instance
          .collection(coursescollectRefName)
          .doc(id)
          .collection('sections');

      var res = await sectionCollectionRef.orderBy('order').get();

      if (res.docs.isNotEmpty) {
        for (DocumentSnapshot section in res.docs) {
          var lessonResponse = await sectionCollectionRef
              .doc(section.id)
              .collection('lessons')
              .orderBy('order')
              .get();
          sections.add(Section(
              name: section['name'],
              lessons: lessonResponse.docs
                  .map((e) => Lesson.fromJson(e.data()))
                  .toList()));
        }
        return sections;
      }
    } catch (e) {
      debugPrint(e.toString());
      return sections;
    }
    return null;
  }
}
