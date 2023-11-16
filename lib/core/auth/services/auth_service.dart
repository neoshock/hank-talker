import 'package:hank_talker_mobile/core/repositories/http_model.dart';
import 'package:hank_talker_mobile/interceptors/api_interceptor.dart';
import 'dart:convert';

class AuthService {
  final ApiInterceptor api = ApiInterceptor();

  Future<HttpBaseResponse> login(String email, String password) async {
    try {
      final response = await api.post(
          '/Auth/login',
          jsonEncode({
            'email': email,
            'password': password,
          }));
      final decodedData = json.decode(response.body);
      if (response.statusCode == 200) {
        return HttpBaseResponse.fromJson(decodedData as Map<String, dynamic>);
      }
      return HttpBaseResponse.fromJson(decodedData as Map<String, dynamic>);
    } catch (e) {
      return HttpBaseResponse(
          code: 500,
          data: null,
          message: 'Hubo un problema al iniciar sesion',
          detail: null);
    }
  }
}
