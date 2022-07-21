import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gems_tarifi/data/database/database_query.dart';
import 'package:gems_tarifi/data/model/content_model_item.dart';
import 'package:gems_tarifi/presentation/widgets/take_screenshot.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:share_plus/share_plus.dart';

class MainAppState with ChangeNotifier {

  DatabaseQuery _databaseQuery = DatabaseQuery();

  DatabaseQuery get getDatabaseQuery => _databaseQuery;

  final _screenshotController = ScreenshotController();

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


  takeScreenshot(ContentModelItem item) async {
    final unit8List = await _screenshotController.captureFromWidget(TakeScreenShot(item: item));
    String tempPath = (Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory())!.path;
    File file = File('$tempPath/citation_${item.id}.jpg');
    await file.writeAsBytes(unit8List);
    await Share.shareFiles([file.path], sharePositionOrigin: Rect.fromLTWH(0, 0, 10, 10),
    );
  }
}