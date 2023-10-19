import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/features/learning/models/category_model.dart';

final List<CategoryModel> categoriesModel = [
  CategoryModel(
      id: 1,
      title: 'Alfabeto',
      description: 'Alfabeto en lenguaje de señas',
      imageUrl:
          'https://www.wannapik.com/media/W1siZiIsIjIwMTYvMDgvMjQvN3YydmE2MGM1Yl83Yjh1azN2enpoX3ZjMDk4MDA5LnBuZyJdXQ/17a6e5ec789e0363/7b8uk3vzzh_vc098009.png',
      idLanguage: 1,
      idDificult: 1),
  CategoryModel(
      id: 2,
      title: 'Numeros',
      description: 'Numeros en lenguaje de señas',
      imageUrl:
          'https://www.wannapik.com/media/W1siZiIsIjIwMTYvMDgvMjQvN3YydmE2MGM1Yl83Yjh1azN2enpoX3ZjMDk4MDA5LnBuZyJdXQ/17a6e5ec789e0363/7b8uk3vzzh_vc098009.png',
      idLanguage: 1,
      idDificult: 1),
  CategoryModel(
      id: 3,
      title: 'Colores',
      description: 'Colores en lenguaje de señas',
      imageUrl:
          'https://www.wannapik.com/media/W1siZiIsIjIwMTYvMDgvMjQvN3YydmE2MGM1Yl83Yjh1azN2enpoX3ZjMDk4MDA5LnBuZyJdXQ/17a6e5ec789e0363/7b8uk3vzzh_vc098009.png',
      idLanguage: 1,
      idDificult: 1),
  CategoryModel(
      id: 4,
      title: 'Animales',
      description: 'Animales en lenguaje de señas',
      imageUrl:
          'https://www.wannapik.com/media/W1siZiIsIjIwMTYvMDgvMjQvN3YydmE2MGM1Yl83Yjh1azN2enpoX3ZjMDk4MDA5LnBuZyJdXQ/17a6e5ec789e0363/7b8uk3vzzh_vc098009.png',
      idLanguage: 1,
      idDificult: 1),
  CategoryModel(
      id: 5,
      title: 'Frutas',
      description: 'Frutas en lenguaje de señas',
      imageUrl:
          'https://www.wannapik.com/media/W1siZiIsIjIwMTYvMDgvMjQvN3YydmE2MGM1Yl83Yjh1azN2enpoX3ZjMDk4MDA5LnBuZyJdXQ/17a6e5ec789e0363/7b8uk3vzzh_vc098009.png',
      idLanguage: 1,
      idDificult: 1),
];

class LearningProvider with ChangeNotifier {
  final List<CategoryModel> _categories = categoriesModel;
  List<CategoryModel> get categories => _categories;

  Future<List<CategoryModel>> getAllCategories() {
    return Future.delayed(const Duration(seconds: 1), () {
      return _categories;
    });
  }
}
