import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/core/auth/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  final AuthService authService = AuthService();

  bool _isAuth = false;
  bool get isAuth => _isAuth;

  Future<bool> login(String email, String password) async {
    final bool isLogged = await authService.login(email, password);

    if (isLogged) {
      _isAuth = true;
      notifyListeners();
    }

    return isLogged;
  }
}
