class ImageFile {
  int id;
  dynamic name;
  String urlFile;

  ImageFile({
    required this.id,
    required this.name,
    required this.urlFile,
  });

  factory ImageFile.fromJson(Map<String, dynamic> json) => ImageFile(
        id: json['id'] as int,
        name: json['name'] as dynamic,
        urlFile: json['urlFile'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'urlFile': urlFile,
      };
}
