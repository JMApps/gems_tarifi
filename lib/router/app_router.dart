import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gems_tarifi/pages/content_page.dart';
import 'package:gems_tarifi/pages/favorite_content_page.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => ContentPage());
      case '/favorite':
        return MaterialPageRoute(builder: (_) => FavoriteContentPage());
      default:
        throw Exception('Invalid route');
    }
  }
}
