import 'package:flutter/material.dart';
import '../utils/shared_preferences_singleton.dart';

class ThemeNotifier extends ChangeNotifier {
  static const String prefKey = "isDarkMode";

  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;

  ThemeNotifier() {
    _loadFromPrefs();
  }

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    _saveToPrefs();
    notifyListeners();
  }

  void setDarkMode() {
    if (!_isDarkMode) {
      _isDarkMode = true;
      _saveToPrefs();
      notifyListeners();
    }
  }

  void setLightMode() {
    if (_isDarkMode) {
      _isDarkMode = false;
      _saveToPrefs();
      notifyListeners();
    }
  }

  void _loadFromPrefs() {
    _isDarkMode = SharedPreferencesSingleton.getBool(prefKey);
    notifyListeners();
  }

  void _saveToPrefs() {
    SharedPreferencesSingleton.setBool(prefKey, _isDarkMode);
  }
}
