import 'dart:io';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:gems_tarifi/application/strings/app_constraints.dart';
import 'package:gems_tarifi/domain/models/citation_model.dart';
import 'package:gems_tarifi/presentation/widgets/card_screenshot.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:html/parser.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class MainAppState extends ChangeNotifier {
  final Box _appSettingsBox = Hive.box(AppConstraints.keyAppSettingsBox);

  final Box _favoriteCitationsBox = Hive.box(AppConstraints.keyAppFavoritesBox);

  final ScreenshotController _screenshotController = ScreenshotController();

  MainAppState() {
    _favoriteCitationsList = _favoriteCitationsBox
        .get(AppConstraints.keyFavoriteCitationIds, defaultValue: <int>[]);
  }

  int _bottomItemIndex = 0;

  int get getBottomItemIndex => _bottomItemIndex;

  set changeBottomIndex(int index) {
    _bottomItemIndex = index;
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

  toggleFavoriteState(int citationId) {
    if (_favoriteCitationsList.contains(citationId)) {
      _favoriteCitationsList.remove(citationId);
    } else {
      _favoriteCitationsList.add(citationId);
    }
    _favoriteCitationsBox.put(
        AppConstraints.keyFavoriteCitationIds, _favoriteCitationsList);
    notifyListeners();
  }

  bool citationIsFavorite(int citationId) {
    return _favoriteCitationsList.contains(citationId);
  }

  String _parseHtmlText(String htmlText) {
    final documentText = parse(htmlText);
    final String parsedString = parse(documentText.body!.text).documentElement!.text;
    return parsedString;
  }
}
