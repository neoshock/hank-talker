// To parse this JSON data, do
//
//     final categoryDetailModel = categoryDetailModelFromJson(jsonString);

import 'dart:convert';

class CategoryDetailModel {
  int id;
  String title;
  String description;
  int totalTopics;
  int pendingTopics;
  dynamic orderNumber;
  dynamic backgroundUrl;
  dynamic iconUrl;
  List<Topic> topics;

  CategoryDetailModel({
    required this.id,
    required this.title,
    required this.description,
    required this.totalTopics,
    required this.pendingTopics,
    required this.orderNumber,
    required this.backgroundUrl,
    required this.iconUrl,
    required this.topics,
  });

  factory CategoryDetailModel.fromJson(Map<String, dynamic> json) =>
      CategoryDetailModel(
        // The argument type 'dynamic' can't be assigned to the parameter type
        // 'int'.dartargument_type_not_assignable
        id: json['id']as int,
        title: json['title'].toString(),
        description: json['description'].toString(),
        totalTopics: json['totalTopics'] as int,
        pendingTopics: json['pendingTopics'] as int,
        orderNumber: json['orderNumber'],
        backgroundUrl: json['backgroundUrl'],
        iconUrl: json['iconUrl'],
        // ignore: avoid_dynamic_calls
        topics: List<Topic>.from((json['topics'] as List)
            .map((e) => Topic.fromJson(e as Map<String, dynamic>))),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'totalTopics': totalTopics,
        'pendingTopics': pendingTopics,
        'orderNumber': orderNumber,
        'backgroundUrl': backgroundUrl,
        'iconUrl': iconUrl,
        'topics': List<dynamic>.from(topics.map((x) => x.toJson())),
      };
}

class Topic {
  int id;
  String name;
  int orderNumber;
  String iconUrl;
  int totalLessons;
  int pendingLessons;
  dynamic lessons;

  Topic({
    required this.id,
    required this.name,
    required this.orderNumber,
    required this.iconUrl,
    required this.totalLessons,
    required this.pendingLessons,
    required this.lessons,
  });

  factory Topic.fromJson(Map<String, dynamic> json) => Topic(
        id: json['id'] as int,
        name: json['name'].toString(),
        orderNumber: json['orderNumber'] as int,
        iconUrl: json['iconUrl'].toString(),
        totalLessons: json['totalLessons'] as int,
        pendingLessons: json['pendingLessons'] as int,
        lessons: json['lessons'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'orderNumber': orderNumber,
        'iconUrl': iconUrl,
        'totalLessons': totalLessons,
        'pendingLessons': pendingLessons,
        'lessons': lessons,
      };
}
