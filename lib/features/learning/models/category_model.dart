class CategoryModel {
    int id;
    String title;
    String description;
    int totalTopics;
    int pendingTopics;
    int orderNumber;
    dynamic backgroundUrl;
    dynamic iconUrl;
    dynamic topics;

    CategoryModel({
        required this.id,
        required this.title,
        required this.description,
        required this.totalTopics,
        required this.pendingTopics,
        required this.orderNumber,
        required this.backgroundUrl,
        required this.iconUrl,
        required this.topics,
    });

    factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: int.parse(json['id'].toString()),
        title: json['title'].toString(),
        description: json['description'].toString(),
        totalTopics: int.parse(json['totalTopics'].toString()),
        pendingTopics: int.parse(json['pendingTopics'].toString()),
        orderNumber: int.parse(json['orderNumber'].toString()),
        backgroundUrl: json['backgroundUrl'],
        iconUrl: json['iconUrl'],
        topics: json['topics'],
    );

    Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'totalTopics': totalTopics,
        'pendingTopics': pendingTopics,
        'orderNumber': orderNumber,
        'backgroundUrl': backgroundUrl,
        'iconUrl': iconUrl,
        'topics': topics,
    };
}
