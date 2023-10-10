import 'package:hank_talker_mobile/interceptors/api_interceptor.dart';

class AuthService {
  final ApiInterceptor api = ApiInterceptor();

  Future<bool> login(String email, String password) async {
    try {
      final response = await api.post('/auth/login', {
        'email': email,
        'password': password,
      });

      if (response.statusCode == 200) {
        return true;
      }

      return false;
    } catch (e) {
      return false;
    }
  }
}
