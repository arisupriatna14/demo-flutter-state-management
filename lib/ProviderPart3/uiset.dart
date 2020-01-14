import 'package:flutter/material.dart';

class UISet with ChangeNotifier {
  static double _fontSize = 0.5;

  double get fontSize => _fontSize * 32;
  double get sliderFontSize => _fontSize;

  set fontSize(double newValue) {
    _fontSize = newValue;
    notifyListeners();
  }
}