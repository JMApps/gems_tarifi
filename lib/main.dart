import 'package:flutter/material.dart';
import 'package:gems_tarifi/presentation/pages/main_page.dart';
import 'package:gems_tarifi/provider/main_app_state.dart';
import 'package:provider/provider.dart';

void main() {
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
