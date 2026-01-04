import 'package:shared_preferences/shared_preferences.dart';

class PreferencesManage {
  static var fcmToken = "fcm_token";
  static var isUserLoggedIn = "IsUserLoggedIn";
  static var id = "id";
  static var firstName = "first_name";
  static var lastName = "last_name";
  static var mobileNo = "mobile_no";
  static var email = "email";
  static var address = "address";
  static var image = "image";
  static var token = "token";
  static var status = "status";

  static Future<void> setPreferencesValue(var key, var value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  static Future getPreferencesValue(var key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static Future clearPreferencesData() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }
}
