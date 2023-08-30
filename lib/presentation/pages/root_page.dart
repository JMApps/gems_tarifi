import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gems_tarifi/application/state/content_settings_state.dart';
import 'package:gems_tarifi/application/state/main_app_state.dart';
import 'package:gems_tarifi/application/strings/app_strings.dart';
import 'package:gems_tarifi/application/themes/app_theme.dart';
import 'package:gems_tarifi/presentation/pages/main_page.dart';
import 'package:gems_tarifi/presentation/widgets/default_scroll_behavior.dart';
import 'package:provider/provider.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MainAppState(),
        ),
        ChangeNotifierProvider(
          create: (_) => ContentSettingsState(),
        ),
      ],
      child: MaterialApp(
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
        home: const MainPage(),
      ),
    );
  }
}
