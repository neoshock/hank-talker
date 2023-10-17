import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/core/auth/services/auth_service.dart';
import 'package:hank_talker_mobile/core/repositories/http_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  final AuthService authService = AuthService();

  bool _isAuth = false;
  bool get isAuth => _isAuth;

  Future<HttpBaseResponde> login(String email, String password) async {
    final respose = await authService.login(email, password);
    final prefs = await SharedPreferences.getInstance();
    if (respose.code == 200) {
      await prefs.setString('token', respose.data['token'].toString());
      _isAuth = true;
    } else {
      _isAuth = false;
    }
    notifyListeners();
    return respose;
  }
}
