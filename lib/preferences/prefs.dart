import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static late SharedPreferences _prefs;

  static Future<SharedPreferences> init() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs;
  }

  static Future<bool> setUserId(String key, String? value) async =>
      await _prefs.setString(key, value!);

  static getUserId(String key) => _prefs.getString(key) ?? "";

  static Future<bool> setUsername(String key, String? value) async =>
      await _prefs.setString(key, value!);

  static getUsername(String key) => _prefs.getString(key) ?? "";

  static Future<bool> setPhoneNumber(String key, String? value) async =>
      await _prefs.setString(key, value!);

  static getPhoneNumber(String key) => _prefs.getString(key) ?? "";

  static Future<bool> setAccessToken(String key, String? value) async =>
      await _prefs.setString(key, value!);

  static getAccessToken(String key) => _prefs.getString(key) ?? "";

  static Future<bool> setUserDp(String key, String? value) async =>
      await _prefs.setString(key, value!);

  static getUserDp(String key) => _prefs.getString(key) ?? "";

  static Future<bool> setLoggedInStatus(String key, bool? value) async =>
      await _prefs.setBool(key, value!);

  static getLoggedInStatus(String key) => _prefs.getBool(key) ?? false;

  static Future<bool> setWalletBalance(String key, double? value) async =>
      await _prefs.setDouble(key, value!);

  static getWalletBalance(String key) => _prefs.getDouble(key) ?? 0.0;

  static Future<bool> setExpiryTimestamp(String key, String? value) async =>
      await _prefs.setString(key, value!);

  static getExpiryTimestamp(String key) => _prefs.getString(key) ?? "";

  static Future<bool> setUserStatus(String key, String? value) async =>
      await _prefs.setString(key, value!);

  static getUserStatus(String key) => _prefs.getString(key) ?? "";

  static Future<bool> setCardNumber(String key, String? value) async =>
      await _prefs.setString(key, value!);

  static getCardNumber(String key) => _prefs.getString(key) ?? "";
}
