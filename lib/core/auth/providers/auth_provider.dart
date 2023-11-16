import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/core/auth/models/user_model.dart';
import 'package:hank_talker_mobile/core/auth/services/auth_service.dart';
import 'package:hank_talker_mobile/core/repositories/http_model.dart';
import 'package:hank_talker_mobile/core/repositories/preferences.dart';
import 'package:hank_talker_mobile/core/repositories/user_new.dart';

final UserNew _userModel = UserNew(
    email: 'John@mail.com',
    firstname: 'Doe',
    lastName: 'Doe',
    photoUrl:
        'https://img.freepik.com/premium-vector/female-user-profile-avatar-is-woman-character-screen-saver-with-emotions_505620-617.jpg');

class AuthProvider with ChangeNotifier {
  AuthProvider() {
    validateToken();
  }

  final AuthService authService = AuthService();
  final _user = _userModel;
  UserNew get user => _user;

  bool _isAuth = false;
  bool get isAuth => _isAuth;

  //validate if user has token
  Future<bool> validateToken() async {
    final token = await Preferences().getPreferences('token');
    debugPrint(token.toString());
    if (token != null) {
      _isAuth = true;
      notifyListeners();
      return true;
    } else {
      _isAuth = false;
      notifyListeners();
      return false;
    }
  }

  Future<HttpBaseResponse> login(String email, String password) async {
    final respose = await authService.login(email, password);
    if (respose.code == 200) {
      _isAuth = true;
      await Preferences().setPreferences('token', respose.data['token']);
    } else {
      _isAuth = false;
    }
    notifyListeners();
    return respose;
  }

  //logout user
  Future<bool> logout() async {
    _isAuth = false;
    await Preferences().erasedPreferences('token');
    notifyListeners();
    return true;
  }

  bool updateUser(String firstName, String lastName, BuildContext cont) {
    var status = false;
    try {
      user
        ..firstname = firstName
        ..lastName = lastName;
      notifyListeners();
      return status = true;
    } on Exception {
      return status;
    }
  }
}
