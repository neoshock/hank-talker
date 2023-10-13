import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/core/register/services/regi_service.dart';
import 'package:hank_talker_mobile/core/repositories/http_model.dart';
import 'package:hank_talker_mobile/core/repositories/user_new.dart';
import 'package:provider/provider.dart';

class RegiProvider with ChangeNotifier {
  final RegiService regiService = RegiService();
  UserNew user = UserNew();

  void enterEmail(String email) {
    this.user.email = email;
  }

  void enterNames(String firstName, String lastName) {
    this.user
      ..firstname = firstName
      ..lastName = lastName;
  }

  void enterDateBirthday(String dateBirthday) {
    this.user.dateBirthday = dateBirthday;
  }

  Future<HttpBaseResponde> register(
    String password,
  ) async {
    final response = await regiService.register(
        user.email, user.firstname, user.lastName, password);
    return response;
  }

  void printUser(String password) {
    this.user.password = password;
    print(this.user.toJson());
  }
}
