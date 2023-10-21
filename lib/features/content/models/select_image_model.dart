class SelectImageModel {
  String name;
  String imageUrl;
  String value;

  SelectImageModel({
    required this.name,
    required this.imageUrl,
    required this.value,
  });

  factory SelectImageModel.fromJson(Map<String, dynamic> json) {
    return SelectImageModel(
      name: json['name'].toString(),
      imageUrl: json['image_url'].toString(),
      value: json['value'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image_url': imageUrl,
      'value': value,
    };
  }
}
