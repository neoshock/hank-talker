import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/core/repositories/http_model.dart';
import 'package:hank_talker_mobile/features/content/models/lesson_model.dart';
import 'package:hank_talker_mobile/features/content/models/topic_model.dart';
import 'package:hank_talker_mobile/features/content/services/content_service.dart';

class ContentProvider with ChangeNotifier {
  final ContentService _contentService = ContentService();

  Future<dynamic> getTopicDetail(int id) async {
    final response = await _contentService.getTopicDetail(id);
    if (response.code == 200) {
      return TopicModel.fromJson(response.data as Map<String, dynamic>);
    }
    return response;
  }

  Future<HttpBaseResponse> getLessonDetail(int lessonId) async {
    final response = await _contentService.getLessonDetail(lessonId);
    if (response.code == 200) {
      final lesson =
          LessonDetailModel.fromJson(response.data as Map<String, dynamic>);
      return HttpBaseResponse(
          code: response.code,
          data: lesson,
          message: response.message,
          detail: response.detail);
    }
    return response;
  }
}
