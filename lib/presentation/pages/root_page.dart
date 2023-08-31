import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gems_tarifi/application/state/content_settings_state.dart';
import 'package:gems_tarifi/application/strings/app_strings.dart';
import 'package:gems_tarifi/application/themes/app_theme.dart';
import 'package:gems_tarifi/presentation/pages/main_page.dart';
import 'package:gems_tarifi/presentation/widgets/default_scroll_behavior.dart';
import 'package:provider/provider.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ContentSettingsState settings = Provider.of<ContentSettingsState>(context);
    return MaterialApp(
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.trackpad,
          PointerDeviceKind.unknown,
        },
      ),
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: DefaultScrollBehavior(),
          child: child!,
        );
      },
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: settings.getAdaptiveTheme
          ? ThemeMode.system
          : settings.getDarkTheme
              ? ThemeMode.dark
              : ThemeMode.light,
      home: const MainPage(),
    );
  }
}
