import 'package:flutter/material.dart';

import 'darkmode.dart';
import 'lightmode.dart';

class Themeprovider extends ChangeNotifier {
  ThemeData appTheme = lightTheme;

  isDarkMode() {
    return !(appTheme == lightTheme);
  }

  toggleTheme() {
    if (appTheme == lightTheme) {
      appTheme = darkTheme;
    } else {
      appTheme = lightTheme;
    }
    ChangeNotifier();
  }
}
