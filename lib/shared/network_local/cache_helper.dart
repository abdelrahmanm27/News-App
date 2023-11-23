import 'package:shared_preferences/shared_preferences.dart';

class CacheHalper {
  static SharedPreferences? prefs;

  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> setAppMode(
      {required String isDarkMode, required bool value}) async {
    return await prefs!.setBool(isDarkMode, value);
  }

  static bool? getAppMode({required String isDarkMode}) {
    return prefs!.getBool(isDarkMode);
  }

  static Future<bool> setCountry(
      {required String selectedCountry, required String value}) async {
    return await prefs!.setString(selectedCountry, value);
  }

  static String? getCountry({required String selectedCountry}) {
    return prefs!.getString(selectedCountry);
  }
}
