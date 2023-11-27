import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/core/profile/models/profile_model.dart';
import 'package:hank_talker_mobile/core/profile/models/region_model.dart';
import 'package:hank_talker_mobile/core/profile/services/profile_services.dart';
import 'package:hank_talker_mobile/core/repositories/http_model.dart';
import 'package:hank_talker_mobile/core/repositories/preferences.dart';
import 'package:hank_talker_mobile/features/content/services/content_service.dart';

class ProfileProvider with ChangeNotifier {
  final ProfileService _profileService = ProfileService();
  UserProfileModel _userProfileModel = UserProfileModel.empty();
  UserProfileModel get userProfileModel => _userProfileModel;
  final Preferences _preferences = Preferences();
  RegionModel? _selectedRegion;
  RegionModel? get selectedRegion => _selectedRegion;
  final ContentService _contentService = ContentService();

  Future<HttpBaseResponse> getProfile() async {
    final response = await _profileService.getProfile();
    if (response.code == 200) {
      _userProfileModel =
          UserProfileModel.fromJson(response.data as Map<String, dynamic>);
      notifyListeners();
    }
    return response;
  }

  Future<HttpBaseResponse> updateProfile(
    String firstName,
    String lastName,
    String birthdate,
  ) async {
    userProfileModel
      ..firstName = firstName
      ..lastName = lastName
      ..birthdate = birthdate;
    final response = await _profileService.updateProfile(userProfileModel);
    if (response.code == 200) {
      notifyListeners();
    }
    return response;
  }

  Future<void> setRegion(RegionModel region) async {
    _selectedRegion = region;
    notifyListeners();
    await _preferences.setPreferences('region', jsonEncode(region.toJson()));
  }

  Future<RegionModel?> getRegion() async {
    final region = await _preferences.getPreferences('region');
    if (region != null) {
      _selectedRegion = RegionModel.fromJson(
          jsonDecode(region.toString()) as Map<String, dynamic>);
      notifyListeners();
    }
    return _selectedRegion;
  }

  Future<HttpBaseResponse> getRegions() async {
    final response = await _profileService.getRegions();
    if (response.code == 200) {
      final list = response.data as List;
      response.data = list
          .map((e) => RegionModel.fromJson(e as Map<String, dynamic>))
          .toList();
      notifyListeners();
    }
    return response;
  }

  Future<void> decrementHeart() async {
    final result = await _profileService.decrementLive();
    if (result.code == 200) {
      _userProfileModel.statistic.remainingLive--;
      notifyListeners();
    }
  }

  Future<HttpBaseResponse> postLessonCompletionRecord(int lessonId) async {
    final response = await _contentService.postLessonCompletionRecord(lessonId);
    if (response.code == 200) {
      return HttpBaseResponse(
          code: response.code,
          data: response.data,
          message: response.message,
          detail: response.detail);
    }
    return response;
  }
}
