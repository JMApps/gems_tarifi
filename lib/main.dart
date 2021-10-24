import 'package:flutter/material.dart';
import 'package:gems_tarifi/provider/app_settings_state.dart';
import 'package:gems_tarifi/provider/bottom_navigation_state.dart';
import 'package:gems_tarifi/provider/item_bookmark_state.dart';
import 'package:gems_tarifi/provider/scroll_positioned_state.dart';
import 'package:gems_tarifi/provider/search_state.dart';
import 'package:gems_tarifi/provider/take_screenshot_state.dart';
import 'package:gems_tarifi/router/app_router.dart';
import 'package:provider/provider.dart';

void main() {
  var _appRouter = AppRouter();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SearchState()),
        ChangeNotifierProvider(create: (_) => BottomNavigationState()),
        ChangeNotifierProvider(create: (_) => ItemBookmarkState()),
        ChangeNotifierProvider(create: (_) => AppSettingsState()),
        ChangeNotifierProvider(create: (_) => TakeScreenshotState()),
        ChangeNotifierProvider(create: (_) => ScrollPositionedState()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Жемчужины Тарифи',
        onGenerateRoute: _appRouter.onGenerateRoute,
        initialRoute: '/',
        theme: ThemeData(fontFamily: 'Gilroy'),
      ),
    ),
  );
}