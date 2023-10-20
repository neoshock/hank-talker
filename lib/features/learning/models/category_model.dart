class CategoryModel {
  int id;
  String title;
  String description;
  String imageUrl;
  int idLanguage;
  int idDificult;

  CategoryModel({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.idLanguage,
    required this.idDificult,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: int.parse(json['id'].toString()),
      title: json['title'].toString(),
      description: json['description'].toString(),
      imageUrl: json['imageUrl'].toString(),
      idLanguage: int.parse(json['id_language'].toString()),
      idDificult: int.parse(json['id_dificult'].toString()),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'imageUrl': imageUrl,
        'id_language': idLanguage,
        'id_dificult': idDificult,
      };
}
