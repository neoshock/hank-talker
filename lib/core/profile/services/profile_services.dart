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

  Future<HttpBaseResponse> getRegions() async {
    try {
      final response = await _api.get('/Learn/region');
      final decodedData = json.decode(response.body);
      return HttpBaseResponse.fromJson(decodedData as Map<String, dynamic>);
    } catch (e) {
      print(e);
      return HttpBaseResponse(
          code: 500,
          data: null,
          message: 'Hubo un problema al obtener las regiones',
          detail: null);
    }
  }

  // Question/decrement-live
  Future<HttpBaseResponse> decrementLive() async {
    try {
      final response = await _api.put('/Question/decrement-live', null);
      final decodedData = json.decode(response.body);
      return HttpBaseResponse.fromJson(decodedData as Map<String, dynamic>);
    } catch (e) {
      print(e);
      return HttpBaseResponse(
          code: 500,
          data: null,
          message: 'Hubo un problema al decrementar las vidas',
          detail: null);
    }
  }
}
