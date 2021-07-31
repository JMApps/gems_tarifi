import 'package:flutter/material.dart';
import 'package:gems_tarifi/pages/content_page.dart';
import 'package:gems_tarifi/router/app_router.dart';

void main() {
  var _appRouter = AppRouter();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Жемчужины Тарифи',
      initialRoute: '/',
      onGenerateRoute: _appRouter.onGenerateRoute,
      theme: ThemeData(fontFamily: 'Gilroy'),
      home: ContentPage(),
    ),
  );
}