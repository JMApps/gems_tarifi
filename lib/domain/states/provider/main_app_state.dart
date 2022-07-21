import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gems_tarifi/data/database/database_query.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MainAppState with ChangeNotifier {

  DatabaseQuery _databaseQuery = DatabaseQuery();

  DatabaseQuery get getDatabaseQuery => _databaseQuery;

  int _selectedIndex = 0;

  int get getSelectedIndex => _selectedIndex;

  final _scrollPositioned = ItemScrollController();

  ItemScrollController get getScrollPositioned => _scrollPositioned;

  updateSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  updateBookmarkState(int favoriteState, int itemId) {
    _databaseQuery.addRemoveFavorite(favoriteState, itemId);
    notifyListeners();
  }

  toIndex() {
    var randomNumber = Random();
    _scrollPositioned.scrollTo(
        index: randomNumber.nextInt(500),
        duration: Duration(seconds: 1),
        curve: Curves.easeInOutCubic);
  }
}