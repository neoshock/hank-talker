class LinkWordImageModel {
  List<LinkedImageModel> images;
  List<LinkedWordModel> words;

  LinkWordImageModel({required this.images, required this.words});

  LinkWordImageModel.fromJson(Map<String, dynamic> json)
      : images = json['images'] as List<LinkedImageModel>,
        words = json['words'] as List<LinkedWordModel>;

  Map<String, dynamic> toJson() => {
        'images': images,
        'words': words,
      };
}

class LinkedImageModel {
  String imageUrl;
  String value;

  LinkedImageModel({required this.imageUrl, required this.value});

  LinkedImageModel.fromJson(Map<String, dynamic> json)
      : imageUrl = json['imageUrl'].toString(),
        value = json['value'].toString();

  Map<String, dynamic> toJson() => {
        'imageUrl': imageUrl,
        'value': value,
      };
}

class LinkedWordModel {
  String word;
  String value;

  LinkedWordModel({required this.word, required this.value});

  LinkedWordModel.fromJson(Map<String, dynamic> json)
      : word = json['word'].toString(),
        value = json['value'].toString();

  Map<String, dynamic> toJson() => {
        'word': word,
        'value': value,
      };
}
