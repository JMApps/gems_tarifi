import 'package:flutter/material.dart';
import 'package:gems_tarifi/provider/bottom_navigation_state.dart';
import 'package:gems_tarifi/provider/search_state.dart';
import 'package:gems_tarifi/router/app_router.dart';
import 'package:provider/provider.dart';

void main() {
  var _appRouter = AppRouter();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SearchState()),
        ChangeNotifierProvider(create: (_) => BottomNavigationState()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Жемчужины Тарифи',
        initialRoute: '/',
        onGenerateRoute: _appRouter.onGenerateRoute,
        theme: ThemeData(fontFamily: 'Gilroy'),
      ),
    ),
  );
}