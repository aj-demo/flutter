

import "package:flutter/cupertino.dart";
import "package:shared_preferences/shared_preferences.dart";

Future<SharedPreferences> Function() getPrefs = (() {
  SharedPreferences? prefs;
  return () async {
    prefs ??= await SharedPreferences.getInstance();
    return prefs as SharedPreferences;
  };
})();

abstract final class LoginHelper {
  @protected
  static const String key = 'token';
  static Future<bool> isLogin() async {
    SharedPreferences prefs = await getPrefs();
    String? token = prefs.getString(key);
    return token != null;
  }
  static Future<bool> login(String token) async {
    SharedPreferences prefs = await getPrefs();
    return prefs.setString(key, token);
  }
  static Future<bool> logout() async {
    SharedPreferences prefs = await getPrefs();
    prefs.remove(key).then((data) {
      print(data);
    });
    return true;
  }
}
