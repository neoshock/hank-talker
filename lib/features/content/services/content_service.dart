import 'dart:convert';

import 'package:hank_talker_mobile/core/repositories/http_model.dart';
import 'package:hank_talker_mobile/interceptors/api_interceptor.dart';

class ContentService {
  final ApiInterceptor _apiInterceptor = ApiInterceptor();

  // Get Topic Detail
  // /Question/topic/3
  Future<HttpBaseResponse> getTopicDetail(int id) async {
    try {
      final response = await _apiInterceptor.get('/Question/topic/$id');
      final decodedData = json.decode(response.body);
      if (response.statusCode == 200) {
        return HttpBaseResponse.fromJson(decodedData as Map<String, dynamic>);
      }
      return HttpBaseResponse.fromJson(decodedData as Map<String, dynamic>);
    } catch (e) {
      return HttpBaseResponse(
          code: 500,
          data: null,
          message: 'Hubo un problema al obtener las categorias',
          detail: null);
    }
  }

  Future<HttpBaseResponse> getLessonDetail(int lessonId) async {
    try {
      final response = await _apiInterceptor.get('/Question/lesson/$lessonId');
      final decodedData = json.decode(response.body);
      if (response.statusCode == 200) {
        return HttpBaseResponse.fromJson(decodedData as Map<String, dynamic>);
      }
      return HttpBaseResponse.fromJson(decodedData as Map<String, dynamic>);
    } catch (e) {
      return HttpBaseResponse(
          code: 500,
          data: null,
          message: 'Hubo un problema al obtener las categorias',
          detail: null);
    }
  }

  // {{LOCAL_URL_BACK}}/api/Question/lesson-completion-record/1
  Future<HttpBaseResponse> postLessonCompletionRecord(int lessonId) async {
    try {
      final response = await _apiInterceptor.post(
          '/Question/lesson-completion-record/$lessonId', null);
      final decodedData = json.decode(response.body);
      return HttpBaseResponse.fromJson(decodedData as Map<String, dynamic>);
    } catch (e) {
      print(e);
      return HttpBaseResponse(
          code: 500,
          data: null,
          message: 'Hubo un problema al obtener las categorias',
          detail: null);
    }
  }
}
