import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/core/profile/models/profile_model.dart';
import 'package:hank_talker_mobile/core/profile/services/profile_services.dart';
import 'package:hank_talker_mobile/core/repositories/http_model.dart';
import 'package:hank_talker_mobile/core/repositories/preferences.dart';

class ProfileProvider with ChangeNotifier {
  final ProfileService _profileService = ProfileService();
  UserProfileModel _userProfileModel = UserProfileModel.empty();
  UserProfileModel get userProfileModel => _userProfileModel;
  final Preferences _preferences = Preferences();

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
}
