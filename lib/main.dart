import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gems_tarifi/domain/constants.dart';
import 'package:gems_tarifi/presentation/pages/main_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  await Hive.initFlutter();
  await Hive.openBox(Constants.keyMainSettings);
  runApp(
    MainPage(),
  );
}
