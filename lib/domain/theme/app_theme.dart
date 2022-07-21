import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xFFFAFAFA),
    fontFamily: 'Gilroy',
    colorScheme: const ColorScheme.light(),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF4E342E),
      centerTitle: true,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontFamily: 'Gilroy',
      ),
    ),
  );

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black54,
    fontFamily: 'Gilroy',
    colorScheme: const ColorScheme.dark(),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontFamily: 'Gilroy',
      ),
    ),
  );
}

extension ColorSchemeS on ColorScheme {
  Color get mainBackgroundColor => brightness == Brightness.light
      ? const Color(0xFFFFFFFF)
      : const Color(0xFF192226);

  Color get cardColorIsOdd => brightness == Brightness.light
      ? const Color(0xFFEEEEEE)
      : const Color(0xDD000000);

  Color get cardColorIsNotOdd => brightness == Brightness.light
      ? const Color(0xFFEFEBE9)
      : const Color(0xFF3E2723);

  Color get mainAccentColor => brightness == Brightness.light
      ? const Color(0xFF673AB7)
      : const Color(0xFF00695C);
}
