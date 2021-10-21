import 'package:flutter/cupertino.dart';

class SearchState with ChangeNotifier {
  String _searchContent = '';

  String get getSearchContent => _searchContent;

  updateSearchContent(String newText) {
    _searchContent = newText;
    notifyListeners();
  }
}