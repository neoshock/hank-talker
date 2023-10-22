import 'dart:core';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  Future<bool> setPreferences(String key, dynamic value) async {
    var status = false;
    try {
      final prefs = await SharedPreferences.getInstance();
      switch (value.runtimeType) {
        case int:
          await prefs.setInt(key, value as int);
          status = true;
        case String:
          await prefs.setString(key, value.toString());
          status = true;
        case bool:
          await prefs.setBool(key, value as bool);
          status = true;
        case double:
          await prefs.setDouble(key, value as double);
          status = true;
      }
      return status;
    } on Exception {
      return status;
    }
  }

  dynamic getPreferences(String key) async {
    final prefs = await SharedPreferences.getInstance();
    try {
      final dynamic value = prefs.get(key);
      return value;
    } on Exception {
      return null;
    }
  }

  Future<bool> erasedPreferences(String key) async {
    var status = false;
    final prefs = await SharedPreferences.getInstance();
    try {
      await prefs.remove(key);
      return status = true;
    } on Exception {
      return status;
    }
  }
}
