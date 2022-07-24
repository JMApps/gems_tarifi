import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xFFFAFAFA),
    fontFamily: 'Gilroy',
    canvasColor: Color(0xFFEFEBE9),
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
    scaffoldBackgroundColor: Color(0xFF263238),
    fontFamily: 'Gilroy',
    canvasColor: Color(0xFF192226),
    colorScheme: const ColorScheme.dark(),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF192226),
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
  Color get mainTextColor => brightness == Brightness.light
      ? const Color(0xFF192226)
      : const Color(0xFFD7D7D7);

  Color get cardColorIsOdd => brightness == Brightness.light
      ? const Color(0xFFEEEEEE)
      : const Color(0xFF192226);

  Color get cardColorIsNotOdd => brightness == Brightness.light
      ? const Color(0xFFEFEBE9)
      : const Color(0xFF1F2B2F);

  Color get mainAccentColor => brightness == Brightness.light
      ? const Color(0xFF673AB7)
      : const Color(0xFFF44336);
}
