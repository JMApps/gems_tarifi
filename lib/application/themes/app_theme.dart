import 'package:flutter/material.dart';
import 'package:gems_tarifi/application/styles/app_styles.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.deepPurple,
    scaffoldBackgroundColor: const Color(0xFFFAFAFA),
    fontFamily: 'Nexa',
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF795548),
      centerTitle: true,
      elevation: 0,
      shape: AppStyles.appBarBroder,
    ),
    cardTheme: const CardTheme(
      margin: AppStyles.mainMarding,
      shape: AppStyles.mainShape,
      elevation: 2,
      color: Color(0xFFFFFFFF),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFFEEEEEE),
      selectedItemColor: Color(0xFF673AB7),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.red,
    scaffoldBackgroundColor: const Color(0xFF2E3C44),
    fontFamily: 'Nexa',
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      shape: AppStyles.appBarBroder,
      backgroundColor: Color(0xFF1B2328),
    ),
    cardTheme: const CardTheme(
      margin: AppStyles.mainMarding,
      shape: AppStyles.mainShape,
      elevation: 2,
      color: Color(0xFF1B2328),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF1B2328),
      selectedItemColor: Color(0xFFF44336),
    ),
  );
}

extension CustomColors on ColorScheme {
  Color get primaryColor => brightness == Brightness.light
      ? const Color(0xFF673AB7)
      : const Color(0xFFF44336);

  Color get circleIdColor => brightness == Brightness.light
      ? const Color(0xFFE0E0E0)
      : const Color(0xFF2E3C44);
}
