import 'package:flutter/cupertino.dart';
import 'package:gems_tarifi/data/database_query.dart';

class ItemBookmarkState with ChangeNotifier {
  final _databaseQuery = DatabaseQuery();

  bool _bookmarkState = false;

  bool get getBookmarkState => _bookmarkState;

  updateBookmarkState(int state, int id) {
    _databaseQuery.addRemoveFavorite(state, id);
    _bookmarkState = !_bookmarkState;
    notifyListeners();
  }
}