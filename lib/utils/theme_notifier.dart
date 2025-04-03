import 'package:flutter/material.dart';
import 'package:devhub/utils/constants.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme;
  bool _isDarkMode;

  ThemeNotifier(this._currentTheme, this._isDarkMode);

  bool get isDarkMode => _isDarkMode;
  ThemeData get currentTheme => _currentTheme;

  void toggleTheme() {
    if (_isDarkMode) {
      _currentTheme = MyTheme.lightTheme;
      _isDarkMode = false;
    } else {
      _currentTheme = MyTheme.darkTheme;
      _isDarkMode = true;
    }
    notifyListeners(); // Notify the app that the theme has changed
  }
}
