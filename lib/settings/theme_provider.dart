import 'package:flutter/material.dart';

import 'theme_preference.dart';

class ThemeProvider with ChangeNotifier {
  ThemePreference themePreference = ThemePreference();
  int _currentBackgroundColor = 0xff42c6ff;

  int get backgroundColor => _currentBackgroundColor;

  set backgroundColor(int newColor) {
    _currentBackgroundColor = newColor;
    themePreference.setBackgroundColor(newColor);
    notifyListeners();
  }

  Future<void> loadBackgroundColor() async {
    _currentBackgroundColor = await themePreference.getBackgroundColor();
    notifyListeners();
  }
}
