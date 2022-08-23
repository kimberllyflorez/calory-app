import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtils {
  static Future setInt(String key, int value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setInt(key, value);
  }
  static Future getInt(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key);
  }
  static Future setDouble(String key, double value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setDouble(key, value);
  }
  static Future<double> getDouble(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(key) ?? 0.0;
  }
  static Future setString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, value);
  }
  static Future getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
  static Future setBool(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setBool(key, value);
  }
  static Future<bool?> getBool(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }
}