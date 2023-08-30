import 'dart:io';
import 'dart:math';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:gems_tarifi/application/strings/app_constraints.dart';
import 'package:gems_tarifi/domain/models/citation_model.dart';
import 'package:gems_tarifi/presentation/widgets/card_screenshot.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:html/parser.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:share_plus/share_plus.dart';

class MainAppState extends ChangeNotifier {
  final Box _favoriteCitationsBox = Hive.box(AppConstraints.keyAppFavoritesBox);

  final ScreenshotController _screenshotController = ScreenshotController();

  final ItemScrollController _itemScrollController = ItemScrollController();

  ItemScrollController get getItemScrollController => _itemScrollController;

  late final PageController _pageController;

  PageController get getPageController => _pageController;

  final Random random = Random();

  MainAppState() {
    _favoriteCitationsList = _favoriteCitationsBox.get(AppConstraints.keyFavoriteCitationIds, defaultValue: <int>[]);
    _currentPage = _favoriteCitationsBox.get(AppConstraints.keyLastPageCitation, defaultValue: 0);
    _pageController = PageController(initialPage: _currentPage);
  }

  int _bottomItemIndex = 0;

  int get getBottomItemIndex => _bottomItemIndex;

  set changeBottomIndex(int index) {
    _bottomItemIndex = index;
    notifyListeners();
  }

  late int _currentPage;

  int get getCurrentPage => _currentPage;

  set saveCurrentPage(int page) {
    _currentPage = page;
    _favoriteCitationsBox.put(AppConstraints.keyLastPageCitation, page);
    notifyListeners();
  }

  List<int> _favoriteCitationsList = [];

  List<int> get getFavoriteCitationsList => _favoriteCitationsList;

  Future<void> copyCitation(String citation) async {
    await FlutterClipboard.copy(_parseHtmlText(citation));
  }

  Future<void> shareCitation(String citation) async {
    await Share.share(_parseHtmlText(citation), sharePositionOrigin: const Rect.fromLTWH(0, 0, 10, 10 / 2));
  }

  Future<void> takeScreenshot(CitationModel model) async {
    await _screenshotController.captureFromWidget(
        CardScreenshot(model: model),
        delay: const Duration(milliseconds: 100)).then(
      (final image) async {
        final directory = Platform.isIOS
            ? await getApplicationDocumentsDirectory()
            : await getExternalStorageDirectory();
        final imagePath = await File('${directory!.path}/citation_${model.id}.jpg').create();
        await imagePath.writeAsBytes(image);
        XFile xPicture = XFile(imagePath.path);
        await Share.shareXFiles([xPicture], sharePositionOrigin: const Rect.fromLTWH(0, 0, 10, 10 / 2));
      },
    );
  }

  Future<void> toggleFavoriteState(int citationId) async {
    if (_favoriteCitationsList.contains(citationId)) {
      _favoriteCitationsList.remove(citationId);
    } else {
      _favoriteCitationsList.add(citationId);
    }
    await _favoriteCitationsBox.put(AppConstraints.keyFavoriteCitationIds, _favoriteCitationsList);
    notifyListeners();
  }

  bool citationIsFavorite(int citationId) {
    return _favoriteCitationsList.contains(citationId);
  }

  Future<void> setListDefaultItem() async {
    await _itemScrollController.scrollTo(index: random.nextInt(605), duration: const Duration(milliseconds: 500));
  }

  String _parseHtmlText(String htmlText) {
    final documentText = parse(htmlText);
    final String parsedString = parse(documentText.body!.text).documentElement!.text;
    return parsedString;
  }
}
