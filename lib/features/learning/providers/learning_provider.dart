import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/core/repositories/http_model.dart';
import 'package:hank_talker_mobile/features/content/models/content_model.dart';
import 'package:hank_talker_mobile/features/content/models/lesson_model.dart';
import 'package:hank_talker_mobile/features/learning/models/category_model.dart';
import 'package:hank_talker_mobile/features/learning/models/cateogry_detail_model.dart';
import 'package:hank_talker_mobile/features/learning/services/learning_services.dart';

class LearningProvider with ChangeNotifier {
  final LearningService _learningService = LearningService();

  Future<List<CategoryModel>> getAllCategories() async {
    final response = await _learningService.getCategoriesByUserAndRegion();
    if (response.code == 200) {
      final list = response.data as List;
      return List.generate(list!.length, (index) {
        return CategoryModel.fromJson(list[index] as Map<String, dynamic>);
      });
    }
    return [];
  }

  Future<CategoryDetailModel> getCategoryDetail(int id) async {
    final response = await _learningService.getCategoryDetail(id);
    if (response.code == 200) {
      return CategoryDetailModel.fromJson(
          response.data as Map<String, dynamic>);
    }
    return CategoryDetailModel(
      id: 0,
      title: '',
      description: '',
      totalTopics: 0,
      pendingTopics: 0,
      orderNumber: 0,
      backgroundUrl: '',
      iconUrl: '',
      topics: [],
    );
  }
}
