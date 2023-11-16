class LessonDetailModel {
  int id;
  String title;
  String description;
  int totalExperience;
  String iconUrl;
  dynamic orderNumber;
  bool isCompleted;
  List<Question> questions;

  LessonDetailModel({
    required this.id,
    required this.title,
    required this.description,
    required this.totalExperience,
    required this.iconUrl,
    required this.orderNumber,
    required this.isCompleted,
    required this.questions,
  });

  factory LessonDetailModel.fromJson(Map<String, dynamic> json) =>
      LessonDetailModel(
        id: json['id'] as int,
        title: json['title'].toString(),
        description: json['description'].toString(),
        totalExperience: json['totalExperience'] as int,
        iconUrl: json['iconUrl'].toString(),
        orderNumber: json['orderNumber'],
        isCompleted: json['isCompleted'] as bool,
        questions: List<Question>.from((json['questions'] as List)
            .map((x) => Question.fromJson(x as Map<String, dynamic>))),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'totalExperience': totalExperience,
        'iconUrl': iconUrl,
        'orderNumber': orderNumber,
        'isCompleted': isCompleted,
        'questions': List<dynamic>.from(questions.map((x) => x.toJson())),
      };
}

class Question {
  int id;
  String title;
  String answer;
  dynamic content;
  int questionTypeId;
  String questionCode;
  String questionDescription;
  String videoLink;

  Question({
    required this.id,
    required this.title,
    required this.answer,
    required this.content,
    required this.questionTypeId,
    required this.questionCode,
    required this.questionDescription,
    required this.videoLink,
  });

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json['id'] as int,
        title: json['title'].toString(),
        answer: json['answer'].toString(),
        content: json['content'],
        questionTypeId: json['questionTypeId'] as int,
        questionCode: json['questionCode'].toString(),
        questionDescription: json['questionDescription'].toString(),
        videoLink: json['videoLink'].toString(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'answer': answer,
        'content': content,
        'questionTypeId': questionTypeId,
        'questionCode': questionCode,
        'questionDescription': questionDescription,
        'videoLink': videoLink,
      };
}

class ContentElement {
  String name;
  String valueUrl;
  String value;

  ContentElement({
    required this.name,
    required this.valueUrl,
    required this.value,
  });

  factory ContentElement.fromJson(Map<String, dynamic> json) => ContentElement(
        name: json['name'].toString(),
        valueUrl: json['valueUrl'].toString(),
        value: json['value'].toString(),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'valueUrl': valueUrl,
        'value': value,
      };
}

class PurpleContent {
  String? valueUrl;
  List<Word> words;
  List<ImageElement>? images;

  PurpleContent({
    this.valueUrl,
    required this.words,
    this.images,
  });

  factory PurpleContent.fromJson(Map<String, dynamic> json) => PurpleContent(
        valueUrl: json['valueUrl'].toString(),
        words: List<Word>.from((json['words'] as List)
            .map((x) => Word.fromJson(x as Map<String, dynamic>))),
        images: json['images'] == null
            ? []
            : List<ImageElement>.from((json['images'] as List)
                .map((x) => ImageElement.fromJson(x as Map<String, dynamic>))),
      );

  Map<String, dynamic> toJson() => {
        'valueUrl': valueUrl,
        'words': List<dynamic>.from(words.map((x) => x.toJson())),
        'images': images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toJson())),
      };
}

class ImageElement {
  String valueUrl;
  String value;

  ImageElement({
    required this.valueUrl,
    required this.value,
  });

  factory ImageElement.fromJson(Map<String, dynamic> json) => ImageElement(
        valueUrl: json['valueUrl'].toString(),
        value: json['value'].toString(),
      );

  Map<String, dynamic> toJson() => {
        'valueUrl': valueUrl,
        'value': value,
      };
}

class Word {
  String? name;
  String value;

  Word({
    required this.name,
    required this.value,
  });

  factory Word.fromJson(Map<String, dynamic> json) => Word(
        name: json['name'].toString(),
        value: json['value'].toString(),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'value': value,
      };
}
