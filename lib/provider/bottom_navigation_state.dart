import 'package:flutter/material.dart';

class BottomNavigationState with ChangeNotifier {
  int _selectedIndex = 0;

  int get getSelectedIndex => _selectedIndex;

  updateSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}