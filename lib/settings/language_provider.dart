import 'package:flutter/material.dart';

import 'language_preference.dart';

class LanguageProvider with ChangeNotifier {
  LanguagePreference languagePreference = LanguagePreference();
  String _currentLanguage = "en";

  String get language => _currentLanguage;

  set language(String newLang) {
    _currentLanguage = newLang;
    languagePreference.setLanguage(newLang);
    notifyListeners();
  }

  Future<void> loadLanguage() async {
    _currentLanguage = await languagePreference.getLanguage();
    notifyListeners();
  }
}
