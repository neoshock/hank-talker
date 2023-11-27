class RegionModel {
  int id;
  String description;
  String flagUrl;

  RegionModel({
    required this.id,
    required this.description,
    required this.flagUrl,
  });

  RegionModel.empty()
      : id = 0,
        description = '',
        flagUrl = '';

  factory RegionModel.fromJson(Map<String, dynamic> json) => RegionModel(
        id: json["id"] as int,
        description: json["description"].toString(),
        flagUrl: json["flagUrl"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "flagUrl": flagUrl,
      };

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RegionModel &&
        other.id == id &&
        other.description == description &&
        other.flagUrl == flagUrl;
  }

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode => id.hashCode ^ description.hashCode ^ flagUrl.hashCode;
}
