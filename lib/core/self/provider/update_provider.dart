import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/core/auth/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class UpdateSelf with ChangeNotifier {
  bool updateUser(String firstName, String lastName, BuildContext cont) {
    var status = false;
    final user = Provider.of<AuthProvider>(cont, listen: false).user;
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
