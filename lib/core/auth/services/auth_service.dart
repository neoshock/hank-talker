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
      print(response.body);
      final decodedData = json.decode(response.body);

      if (response.statusCode == 200) {
        return HttpBaseResponse.fromJson(decodedData as Map<String, dynamic>);
      }
      return HttpBaseResponse.fromJson(decodedData as Map<String, dynamic>);
    } catch (e) {
      print(e);
      return HttpBaseResponse(
          code: 500,
          data: null,
          message: 'Hubo un problema al iniciar sesion',
          detail: null);
    }
  }

  // {{LOCAL_URL_BACK}}/api/Auth/change-password
  Future<HttpBaseResponse> changePassword(
      String password, String newPassword) async {
    try {
      final response = await api.put(
          '/Auth/change-password',
          jsonEncode({
            'oldPassword': password,
            'newPassword': newPassword,
          }));
      final decodedData = json.decode(response.body);

      if (response.statusCode == 200) {
        return HttpBaseResponse.fromJson(decodedData as Map<String, dynamic>);
      }
      return HttpBaseResponse.fromJson(decodedData as Map<String, dynamic>);
    } catch (e) {
      print(e);
      return HttpBaseResponse(
          code: 500,
          data: null,
          message: 'Hubo un problema al cambiar la contraseña',
          detail: null);
    }
  }

  // {{LOCAL_URL_BACK}}/api/Auth/recover-password   "email": "roberto.suarez@uteq.edu.ec"
  Future<HttpBaseResponse> recoveryPassword(String email) async {
    try {
      final response = await api.post(
          '/Auth/recover-password',
          jsonEncode({
            'email': email,
          }));
      final decodedData = json.decode(response.body);
      if (response.statusCode == 200) {
        return HttpBaseResponse.fromJson(decodedData as Map<String, dynamic>);
      }
      return HttpBaseResponse.fromJson(decodedData as Map<String, dynamic>);
    } catch (e) {
      print(e);
      return HttpBaseResponse(
          code: 500,
          data: null,
          message: 'Hubo un problema al cambiar la contraseña',
          detail: null);
    }
  }
}
