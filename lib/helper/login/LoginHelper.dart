

import "package:shared_preferences/shared_preferences.dart";

Future<SharedPreferences> getPrefs = (() {
  late SharedPreferences prefs;
  return () async {
    prefs ??= await SharedPreferences.getInstance();
    return prefs;
  };
})() as Future<SharedPreferences>;

final class LoginHelper {
  Future<bool> isLogin() async {
    SharedPreferences prefs = await getPrefs;
    String? token = prefs.getString('token');
    return token != null;
  }
}
