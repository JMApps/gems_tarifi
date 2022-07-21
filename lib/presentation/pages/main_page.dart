import 'package:flutter/material.dart';
import 'package:gems_tarifi/domain/states/provider/app_settings_state.dart';
import 'package:gems_tarifi/domain/states/provider/main_app_state.dart';
import 'package:gems_tarifi/domain/theme/app_theme.dart';
import 'package:gems_tarifi/presentation/pages/main_pages_page.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MainAppState>(
          create: (_) => MainAppState(),
        ),
        ChangeNotifierProvider<AppSettingsState>(
          create: (_) => AppSettingsState(),
        ),
      ],
      child: Builder(
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Жемчужины Тарифи',
            themeMode: context.watch<AppSettingsState>().getThemeMode,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            home: MainPagesPage(),
          );
        }
      ),
    );
  }
}
