class ContentModel {
  int id;
  String title;
  String description;
  List<String> tags;
  String fileUrl;

  ContentModel({
    required this.id,
    required this.title,
    required this.description,
    required this.tags,
    required this.fileUrl,
  });

  factory ContentModel.fromJson(Map<String, dynamic> json) {
    return ContentModel(
      id: int.parse(json['id'].toString()),
      title: json['title'].toString(),
      description: json['description'].toString(),
      tags: json['tags'].toString().split(','),
      fileUrl: json['fileUrl'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'tags': tags,
      'fileUrl': fileUrl,
    };
  }
}
