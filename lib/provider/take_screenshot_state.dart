import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gems_tarifi/model/content_model_item.dart';
import 'package:gems_tarifi/widgets/take_screenshot.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';

class TakeScreenshotState with ChangeNotifier {

  final _screenshotController = ScreenshotController();

  takeScreenshot(ContentModelItem item) async {
    final unit8List = await _screenshotController.captureFromWidget(TakeScreenShot(item: item));
    String tempPath = (Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory())!.path;
    File file = File('$tempPath/dua_${item.id}.jpg');
    await file.writeAsBytes(unit8List);
    await Share.shareFiles([file.path], sharePositionOrigin: Rect.fromLTWH(0, 0, 10, 10),
    );
  }
}
