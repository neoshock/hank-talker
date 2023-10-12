import 'package:hank_talker_mobile/config/conts.dart';
import 'package:http/http.dart' as http;

class ApiInterceptor {
  final String apiUrl = AppConstants.API_BASE_URL;

  final Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  Future<http.Response> get(String url) async {
    return http.get(Uri.parse(apiUrl + url), headers: defaultHeaders);
  }

  Future<http.Response> post(String url, dynamic body) async {
    return http.post(Uri.parse(apiUrl + url),
        headers: defaultHeaders, body: body);
  }

  Future<http.Response> put(String url, dynamic body) async {
    return http.put(Uri.parse(apiUrl + url),
        headers: defaultHeaders, body: body);
  }

  Future<http.Response> delete(String url) async {
    return http.delete(Uri.parse(apiUrl + url), headers: defaultHeaders);
  }
}
