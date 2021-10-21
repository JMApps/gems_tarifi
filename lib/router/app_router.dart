import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gems_tarifi/pages/about_us.dart';
import 'package:gems_tarifi/pages/main_page.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => MainPage(), settings: routeSettings);
      case '/about_us':
        return MaterialPageRoute(
            builder: (_) => AboutUs(), settings: routeSettings);
      default:
        throw Exception('Invalid route');
    }
  }
}
