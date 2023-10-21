import 'package:hank_talker_mobile/features/content/models/content_model.dart';
import 'package:hank_talker_mobile/features/content/models/lesson_model.dart';

class CategoryDetailModel {
  int id;
  String title;
  String description;
  String backgroundUrl;
  List<ContentModel> contents;
  List<LessonModel> lessons;

  CategoryDetailModel({
    required this.id,
    required this.title,
    required this.description,
    required this.backgroundUrl,
    required this.contents,
    required this.lessons,
  });

  factory CategoryDetailModel.fromJson(Map<String, dynamic> json) {
    return CategoryDetailModel(
      id: int.parse(json['id'].toString()),
      title: json['title'].toString(),
      description: json['description'].toString(),
      backgroundUrl: json['backgroundUrl'].toString(),
      contents: (json['contents'] as List<dynamic>)
          .map((e) => ContentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      lessons: (json['lessons'] as List<dynamic>)
          .map((e) => LessonModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'backgroundUrl': backgroundUrl,
      'contents': contents,
      'lessons': lessons,
    };
  }
}
