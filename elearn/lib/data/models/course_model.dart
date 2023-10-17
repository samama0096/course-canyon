import 'package:cloud_firestore/cloud_firestore.dart';

class Course {
  final String id;
  final String title;
  final String brief;
  final String desc;
  final String tutor;
  final String tutorid;
  final String thumnail;
  final int discount;
  final int enrolled;
  final List<String> keylearnings;
  final List<String> requirements;

  final double price;
  final String totaltime;

  Course(
      {required this.id,
      required this.title,
      required this.thumnail,
      required this.brief,
      required this.desc,
      required this.tutor,
      required this.tutorid,
      required this.discount,
      required this.enrolled,
      required this.keylearnings,
      required this.requirements,
      required this.price,
      required this.totaltime});

  static Course fromJson(DocumentSnapshot json) => Course(
      id: json.id,
      title: json['title'],
      brief: json['brief'],
      desc: json['desc'],
      tutor: json['tutor'],
      tutorid: json['tutorid'],
      discount: json['discount'],
      enrolled: json['enrolled'],
      keylearnings: List<String>.from((json['keylearnings'])),
      requirements: List<String>.from((json['requirements'])),
      price: json['price'],
      thumnail: json['thumbnail'],
      totaltime: json['totaltime']);
}
