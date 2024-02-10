// ignore_for_file: cascade_invocations

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/core/profile/providers/profile_provider.dart';
import 'package:hank_talker_mobile/features/learning/models/category_model.dart';
import 'package:hank_talker_mobile/features/learning/models/cateogry_detail_model.dart';
import 'package:hank_talker_mobile/features/learning/services/learning_services.dart';
import 'package:provider/provider.dart';

class LearningProvider with ChangeNotifier {
  final LearningService _learningService = LearningService();

  List<CategoryModel> _categories = [];
  // get
  List<CategoryModel> get categories => _categories;

  Future<List<CategoryModel>> getAllCategories() async {
    _categories = [];
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
      _categories = result;
      notifyListeners();
      return result;
    }
    return [];
  }

  void findCategory(String query) async {
    if (query.isEmpty) {
      await getAllCategories(); // Esto ya llama a notifyListeners()
    } else {
      final result = _categories.where((element) {
        return element.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
      _categories = result;
      notifyListeners();
    }
  }

  Future<CategoryModel?> getCategoryRandom() async {
    final region = await ProfileProvider().getRegion();

    final response =
        await _learningService.getCategoriesByUserAndRegion(region!.id);
    if (response.code == 200) {
      final list = response.data as List;
      final allCategories = List.generate(list.length, (index) {
        return CategoryModel.fromJson(list[index] as Map<String, dynamic>);
      });

      // Filtrar solo categorías disponibles
      final availableCategories =
          allCategories.where((category) => category.isAvailable!).toList();

      if (availableCategories.isNotEmpty) {
        // Ordenar por orderNumber
        availableCategories
            .sort((a, b) => a.orderNumber.compareTo(b.orderNumber));

        // Seleccionar una categoría al azar de las disponibles
        final randomIndex = Random().nextInt(availableCategories.length);
        return availableCategories[randomIndex];
      }
    }
    return null;
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
