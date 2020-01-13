import 'package:flutter/material.dart';

class Cart with ChangeNotifier {
  int _total = 0;

  int get total => _total;
  set total(int value) {
    _total = value;
    notifyListeners();
  }
}