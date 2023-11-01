import 'package:hank_talker_mobile/config/conts.dart';
import 'package:hank_talker_mobile/core/repositories/preferences.dart';
import 'package:http/http.dart' as http;

class ApiInterceptor {
  final String apiUrl = AppConstants.API_BASE_URL;
  final Preferences _preferences = Preferences();

  Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  Future<http.Response> get(String url) async {
    // validate if has token
    final token = await _preferences.getPreferences('token');
    // set token in headers
    if (token != null) {
      defaultHeaders.addEntries(
        [MapEntry('Authorization', 'Bearer $token')],
      );
    }
    print(defaultHeaders);
    return http.get(Uri.parse(apiUrl + url), headers: defaultHeaders);
  }

  Future<http.Response> post(String url, dynamic body) async {
    // validate if has token
    final token = await _preferences.getPreferences('token');
    // set token in headers
    if (token != null) {
      defaultHeaders.addEntries(
        [MapEntry('Authorization', 'Bearer $token')],
      );
    }
    return http.post(
      Uri.parse(apiUrl + url),
      headers: defaultHeaders,
      body: body,
    );
  }

  Future<http.Response> put(String url, dynamic body) async {
    // validate if has token
    final token = await _preferences.getPreferences('token');
    // set token in headers
    if (token != null) {
      defaultHeaders.addEntries(
        [MapEntry('Authorization', 'Bearer $token')],
      );
    }
    return http.put(
      Uri.parse(apiUrl + url),
      headers: defaultHeaders,
      body: body,
    );
  }

  Future<http.Response> delete(String url) async {
    // validate if has token
    final token = await _preferences.getPreferences('token');
    // set token in headers
    if (token != null) {
      defaultHeaders.addEntries(
        [MapEntry('Authorization', 'Bearer $token')],
      );
    }
    return http.delete(Uri.parse(apiUrl + url), headers: defaultHeaders);
  }
}
