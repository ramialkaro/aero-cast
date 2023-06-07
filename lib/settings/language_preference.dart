import 'package:shared_preferences/shared_preferences.dart';

class LanguagePreference {
  static const currentLang = "en";

  setLanguage(String newLang) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(currentLang, newLang);
  }

  Future<String> getLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(currentLang) ?? "en";
  }
}
