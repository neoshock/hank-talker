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
      // set the email and password in the preferences
      await Preferences().setPreferences('email', email);
      await Preferences().setPreferences('password', password);
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
    await Preferences().erasedPreferences('region');
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

  // update password
  Future<HttpBaseResponse> updatePassword(
      String password, String newPassword) async {
    final response = await authService.changePassword(
      password,
      newPassword,
    );
    if (response.code == 200) {
      // set the password in the preferences
      await Preferences().setPreferences('password', newPassword);
      notifyListeners();
    }
    return response;
  }

  // recoveryPassword
  Future<HttpBaseResponse> recoveryPassword(String email) async {
    final response = await authService.recoveryPassword(email);
    if (response.code == 200) {
      notifyListeners();
    }
    return response;
  }

  Future<HttpBaseResponse> autoLogin() async {
    // get the email and password from the preferences
    final email = await Preferences().getPreferences('email');
    final password = await Preferences().getPreferences('password');
    if (email != null && password != null) {
      return await login(email as String, password as String);
    }
    return HttpBaseResponse(
        code: 400, message: 'No hay credenciales', data: {}, detail: {});
  }
}
