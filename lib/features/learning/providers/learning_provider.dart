import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/features/content/models/content_model.dart';
import 'package:hank_talker_mobile/features/content/models/lesson_model.dart';
import 'package:hank_talker_mobile/features/learning/models/category_model.dart';
import 'package:hank_talker_mobile/features/learning/models/cateogry_detail_model.dart';

final List<CategoryModel> categoriesModel = [
  CategoryModel(
      id: 1,
      title: 'Alfabeto',
      description: 'Alfabeto en lenguaje de señas',
      isAvailable: true,
      completedLeves: 3,
      totalLeves: 6,
      imageUrl:
          'https://i.graphicmama.com/blog/wp-content/uploads/2018/01/24111702/01315360772831.5a5f37af060d0.jpg',
      idLanguage: 1,
      idDificult: 1),
  CategoryModel(
      id: 2,
      title: 'Números',
      description: 'Números en lenguaje de señas',
      isAvailable: true,
      completedLeves: 5,
      totalLeves: 15,
      imageUrl:
          'https://i.graphicmama.com/blog/wp-content/uploads/2018/01/24111702/01315360772831.5a5f37af060d0.jpg',
      idLanguage: 1,
      idDificult: 1),
  CategoryModel(
      id: 3,
      title: 'Colores',
      description: 'Colores en lenguaje de señas',
      isAvailable: true,
      completedLeves: 5,
      totalLeves: 6,
      imageUrl:
          'https://i.graphicmama.com/blog/wp-content/uploads/2018/01/24111702/01315360772831.5a5f37af060d0.jpg',
      idLanguage: 1,
      idDificult: 1),
];

final CategoryDetailModel categoryDetailModel = CategoryDetailModel(
    id: 1,
    backgroundUrl:
        'https://img.freepik.com/free-vector/nature-scene-with-river-hills-forest-mountain-landscape-flat-cartoon-style-illustration_1150-37326.jpg?size=626&ext=jpg&ga=GA1.1.386372595.1697846400&semt=sph',
    title: 'Alfabeto',
    description: '',
    contents: List.generate(
        3,
        (index) => ContentModel(
            id: index,
            description: 'Letra A',
            fileUrl: '',
            tags: ['Abecedario', 'Letras'],
            title: 'Letra A $index')),
    lessons: List.generate(
        3,
        (index) => LessonModel(
            title: 'Nivel $index',
            description: 'Alguna descripcion',
            id: index,
            isCompleted: index < 1,
            totalExperience: 320)));

class LearningProvider with ChangeNotifier {
  final List<CategoryModel> _categories = categoriesModel;
  List<CategoryModel> get categories => _categories;

  final CategoryDetailModel _categoryDetail = categoryDetailModel;
  CategoryDetailModel get categoryDetail => _categoryDetail;

  Future<List<CategoryModel>> getAllCategories() {
    return Future.delayed(const Duration(seconds: 1), () {
      return _categories;
    });
  }

  Future<CategoryDetailModel> getCategoryDetail(int id) {
    return Future.delayed(const Duration(seconds: 1), () {
      return _categoryDetail;
    });
  }
}
