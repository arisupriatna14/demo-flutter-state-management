import 'package:flutter/material.dart';

enum MyTheme { light, dark }

class ThemeNotifier with ChangeNotifier {
  static List<ThemeData> themes = [
    ThemeData.light(),
    ThemeData.dark()
  ];

  MyTheme _current = MyTheme.light;
  ThemeData _currentTheme = themes[0];

  get currentTheme => _current;
  get currentThemeData => _currentTheme;

  set currentTheme(theme) {
    if (themes != null) {
      _current = theme;
      _currentTheme = _current == MyTheme.light ? themes[0] : themes[1];
      notifyListeners();
    }
  }
  
  void switchTheme() => currentTheme == MyTheme.light
    ? currentTheme = MyTheme.dark
    : currentTheme = MyTheme.light;
}