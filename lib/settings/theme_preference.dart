import 'package:shared_preferences/shared_preferences.dart';

class ThemePreference {
  static const currentBackground = "0xff42c6ff";

  setBackgroundColor(int newColor) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(currentBackground, newColor);
  }

  Future<int> getBackgroundColor() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(currentBackground) ?? 0xff42c6ff;
  }
}
