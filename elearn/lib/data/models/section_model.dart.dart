class Section {
  final String name;
  final List<Lesson> lessons;

  Section({required this.name, required this.lessons});
  static Section fromJson(Map json) {
    return Section(
        name: json['name'],
        lessons:
            List.from(json['lessons']).map((e) => Lesson.fromJson(e)).toList());
  }
}

class Lesson {
  final String name;
  final String link;

  Lesson({required this.name, required this.link});
  static Lesson fromJson(Map json) =>
      Lesson(name: json['name'], link: json['link']);
}
