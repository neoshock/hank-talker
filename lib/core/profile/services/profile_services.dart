import 'dart:convert';

import 'package:hank_talker_mobile/core/profile/models/profile_model.dart';
import 'package:hank_talker_mobile/core/repositories/http_model.dart';
import 'package:hank_talker_mobile/interceptors/api_interceptor.dart';

class ProfileService {
  final _api = ApiInterceptor();

  Future<HttpBaseResponse> getProfile() async {
    try {
      final response = await _api.get('/User/profile');
      final decodedData = json.decode(response.body);
      if (response.statusCode == 200) {
        return HttpBaseResponse.fromJson(decodedData as Map<String, dynamic>);
      }
      return HttpBaseResponse.fromJson(decodedData as Map<String, dynamic>);
    } catch (e) {
      return HttpBaseResponse(
          code: 500,
          data: null,
          message: 'Hubo un problema al obtener el perfil',
          detail: null);
    }
  }

  Future<HttpBaseResponse> updateProfile(
      UserProfileModel userProfileModel) async {
    try {
      final response = _api.put(
          '/User/update-my-profile', jsonEncode(userProfileModel.toJson()));
      final decodedData = json.decode((await response).body);
      if ((await response).statusCode == 200) {
        return HttpBaseResponse.fromJson(decodedData as Map<String, dynamic>);
      }
      return HttpBaseResponse.fromJson(decodedData as Map<String, dynamic>);
    } catch (e) {
      print(e);
      return HttpBaseResponse(
          code: 500,
          data: null,
          message: 'Hubo un problema al actualizar el perfil',
          detail: null);
    }
  }
}