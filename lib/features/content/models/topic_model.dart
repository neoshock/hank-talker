class TopicModel {
  int id;
  String name;
  int orderNumber;
  String iconUrl;
  int totalLessons;
  int pendingLessons;
  List<Lesson> lessons;

  TopicModel({
    required this.id,
    required this.name,
    required this.orderNumber,
    required this.iconUrl,
    required this.totalLessons,
    required this.pendingLessons,
    required this.lessons,
  });

  factory TopicModel.fromJson(Map<String, dynamic> json) => TopicModel(
        id: json['id'] as int,
        name: json['name'].toString(),
        orderNumber: json['orderNumber'] as int,
        iconUrl: json['iconUrl'].toString(),
        totalLessons: json['totalLessons'] as int,
        pendingLessons: json['pendingLessons'] as int,
        lessons: List<Lesson>.from((json['lessons'] as List)
            .map((x) => Lesson.fromJson(x as Map<String, dynamic>))),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'orderNumber': orderNumber,
        'iconUrl': iconUrl,
        'totalLessons': totalLessons,
        'pendingLessons': pendingLessons,
        'lessons': List<dynamic>.from(lessons.map((x) => x.toJson())),
      };
}

class Lesson {
  int id;
  String title;
  String description;
  int totalExperience;
  String iconUrl;
  dynamic orderNumber;
  bool isCompleted;
  dynamic questions;
  bool isPending = false;

  Lesson({
    required this.id,
    required this.title,
    required this.description,
    required this.totalExperience,
    required this.iconUrl,
    required this.orderNumber,
    required this.isCompleted,
    required this.questions,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
        id: json['id'] as int,
        title: json['title'].toString(),
        description: json['description'].toString(),
        totalExperience: json['totalExperience'] as int,
        iconUrl: json['iconUrl'].toString(),
        orderNumber: json['orderNumber'],
        isCompleted: json['isCompleted'] as bool,
        questions: json['questions'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'totalExperience': totalExperience,
        'iconUrl': iconUrl,
        'orderNumber': orderNumber,
        'isCompleted': isCompleted,
        'questions': questions,
      };
}
