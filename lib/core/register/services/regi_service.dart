import 'dart:convert';

import 'package:hank_talker_mobile/core/repositories/http_model.dart';
import 'package:hank_talker_mobile/interceptors/api_interceptor.dart';

class RegiService {
  final ApiInterceptor api = ApiInterceptor();

  Future<HttpBaseResponde> register(
      String email, String name, String lastName, String password) async {
    try {
      final response = await api.post(
          '/Auth/register',
          jsonEncode({
            'email': email,
            'firstName': name,
            'lastName': lastName,
            'password': password,
          }));
      final decodedData = json.decode(response.body);
      if (response.statusCode == 200) {
        return HttpBaseResponde.fromJson(decodedData as Map<String, dynamic>);
      } else {
        return HttpBaseResponde(
            code: 500, data: null, message: 'Error al registrar', detail: null);
      }
    } catch (e) {
      return HttpBaseResponde(
          code: 500, data: null, message: 'Error al registrar', detail: null);
    }
  }
}
