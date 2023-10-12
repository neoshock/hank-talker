import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/core/auth/services/auth_service.dart';
import 'package:hank_talker_mobile/core/repositories/http_model.dart';

class AuthProvider with ChangeNotifier {
  final AuthService authService = AuthService();

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
}
