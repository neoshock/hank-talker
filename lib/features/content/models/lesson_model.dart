class LessonModel {
  int id;
  String title;
  String description;
  int totalExperience;
  bool isCompleted;

  LessonModel({
    required this.id,
    required this.title,
    required this.description,
    required this.totalExperience,
    required this.isCompleted,
  });

  factory LessonModel.fromJson(Map<String, dynamic> json) {
    return LessonModel(
      id: int.parse(json['id'].toString()),
      title: json['title'].toString(),
      description: json['description'].toString(),
      totalExperience: int.parse(json['totalExperience'].toString()),
      isCompleted: json['isCompleted'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'totalExperience': totalExperience,
      'isCompleted': isCompleted,
    };
  }
}
