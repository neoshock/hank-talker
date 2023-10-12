import 'package:hank_talker_mobile/core/repositories/http_model.dart';
import 'package:hank_talker_mobile/interceptors/api_interceptor.dart';
import 'dart:convert';

class AuthService {
  final ApiInterceptor api = ApiInterceptor();

  Future<HttpBaseResponde> login(String email, String password) async {
    try {
      final response = await api.post('/Auth/login', {
        'email': email,
        'password': password,
      });

      print(response.statusCode);

      if (response.statusCode == 200) {
        final decodedData = json.decode(response.body);
        return HttpBaseResponde.fromJson(decodedData as Map<String, dynamic>);
      }

      if (response.statusCode == 400) {
        final decodedData = json.decode(response.body);
        return HttpBaseResponde.fromJson(decodedData as Map<String, dynamic>);
      }
      return HttpBaseResponde(
          code: 300, data: null, message: 'no vale esa webada', detail: null);
    } catch (e) {
      print(e.toString());
      return HttpBaseResponde(
          code: 300, data: null, message: 'no vale esa webada', detail: null);
    }
  }
}
