import 'package:flutter/material.dart';

class MainAppState extends ChangeNotifier {
  int _bottomItemIndex = 0;

  int get getBottomItemIndex => _bottomItemIndex;

  set changeBottomIndex(int index) {
    _bottomItemIndex = index;
    notifyListeners();
  }
}
