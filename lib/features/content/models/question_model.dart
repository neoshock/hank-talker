class QuestionModel {
  int id;
  String title;
  dynamic content;
  String answer;
  String questionType;

  QuestionModel({
    required this.id,
    required this.title,
    required this.content,
    required this.answer,
    required this.questionType,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      id: int.parse(json['id'].toString()),
      title: json['title'].toString(),
      content: json['content'],
      answer: json['answer'].toString(),
      questionType: json['question_type'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'answer': answer,
      'question_type': questionType,
    };
  }
}
