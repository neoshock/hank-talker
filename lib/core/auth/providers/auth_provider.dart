import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/core/auth/models/user_model.dart';
import 'package:hank_talker_mobile/core/auth/services/auth_service.dart';
import 'package:hank_talker_mobile/core/repositories/http_model.dart';

final UserModel _userModel = UserModel(
    uid: '1',
    email: 'John@mail.com',
    displayName: 'Doe',
    photoUrl:
        'https://img.freepik.com/premium-vector/female-user-profile-avatar-is-woman-character-screen-saver-with-emotions_505620-617.jpg');

class AuthProvider with ChangeNotifier {
  final AuthService authService = AuthService();
  final _user = _userModel;
  UserModel get user => _user;

  bool _isAuth = false;
  bool get isAuth => _isAuth;

  Future<HttpBaseResponde> login(String email, String password) async {
    final respose = await authService.login(email, password);
    if (respose.code == 200) {
      _isAuth = true;
    } else {
      _isAuth = false;
    }
    notifyListeners();
    return respose;
  }

  Future<UserModel> getUser() {
    return Future.value(_user);
  }

  Future<void> updateUserData(UserModel user) {
    _user.displayName = user.displayName;
    _user.photoUrl = user.photoUrl;
    notifyListeners();
    return Future.value();
  }
}
