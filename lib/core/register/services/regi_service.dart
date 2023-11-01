import 'dart:convert';

import 'package:hank_talker_mobile/core/repositories/http_model.dart';
import 'package:hank_talker_mobile/interceptors/api_interceptor.dart';

class RegiService {
  final ApiInterceptor api = ApiInterceptor();

  Future<HttpBaseResponde> register(String email, String name, String lastName,
      String password, String birthDate) async {
    print(birthDate);
    try {
      final response = await api.post(
          '/Auth/register',
          jsonEncode({
            'email': email,
            'firstName': name,
            'lastName': lastName,
            'password': password,
            'birthDate': birthDate
          }));
      final decodedData = json.decode(response.body);
      if (response.statusCode == 200) {
        return HttpBaseResponde.fromJson(decodedData as Map<String, dynamic>);
      }
      return HttpBaseResponde.fromJson(decodedData as Map<String, dynamic>);
    } catch (e) {
      print(e);
      return HttpBaseResponde(
          code: 500, data: null, message: 'Error al registrar', detail: null);
    }
  }
}
