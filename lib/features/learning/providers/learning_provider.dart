// ignore_for_file: cascade_invocations

import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/core/profile/providers/profile_provider.dart';
import 'package:hank_talker_mobile/features/learning/models/category_model.dart';
import 'package:hank_talker_mobile/features/learning/models/cateogry_detail_model.dart';
import 'package:hank_talker_mobile/features/learning/services/learning_services.dart';
import 'package:provider/provider.dart';

class LearningProvider with ChangeNotifier {
  final LearningService _learningService = LearningService();

  Future<List<CategoryModel>> getAllCategories() async {
    final region = await ProfileProvider().getRegion();
    final response =
        await _learningService.getCategoriesByUserAndRegion(region!.id);
    if (response.code == 200) {
      final list = response.data as List;
      final result = List.generate(list!.length, (index) {
        return CategoryModel.fromJson(list[index] as Map<String, dynamic>);
      });
      // order by orderNumber
      result.sort((a, b) => a.orderNumber.compareTo(b.orderNumber));
      return result;
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
