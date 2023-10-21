class CategoryModel {
  int id;
  String title;
  String description;
  String imageUrl;
  bool isAvailable;
  int completedLeves;
  int totalLeves;
  int idLanguage;
  int idDificult;

  CategoryModel({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.isAvailable,
    required this.completedLeves,
    required this.totalLeves,
    required this.idLanguage,
    required this.idDificult,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: int.parse(json['id'].toString()),
      title: json['title'].toString(),
      description: json['description'].toString(),
      imageUrl: json['imageUrl'].toString(),
      isAvailable: json['isAvailable'] as bool,
      completedLeves: int.parse(json['completedLeves'].toString()),
      totalLeves: int.parse(json['totalLeves'].toString()),
      idLanguage: int.parse(json['idLanguage'].toString()),
      idDificult: int.parse(json['idDificult'].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'isAvailable': isAvailable,
      'completedLeves': completedLeves,
      'totalLeves': totalLeves,
      'idLanguage': idLanguage,
      'idDificult': idDificult,
    };
  }
}
