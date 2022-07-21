import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gems_tarifi/domain/constants.dart';
import 'package:gems_tarifi/domain/states/provider/main_app_state.dart';
import 'package:gems_tarifi/presentation/pages/main_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  await Hive.initFlutter();
  await Hive.openBox(Constants.keyMainSettings);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<MainAppState>(
          create: (_) => MainAppState(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Жемчужины Тарифи',
        theme: ThemeData(fontFamily: 'Gilroy'),
        home: MainPage(),
      ),
    ),
  );
}
