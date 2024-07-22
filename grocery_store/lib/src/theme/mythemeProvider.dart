import 'package:flutter/material.dart';
import 'mytheme.dart';

class ThemeNotifier extends ChangeNotifier {
  bool _isDarkMode = false;
  ThemeData _currentTheme = AppTheme.lightTheme;

  bool get isDarkMode => _isDarkMode;
  ThemeData get currentTheme => _currentTheme;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    _currentTheme = _isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme;
    notifyListeners();
  }
}
