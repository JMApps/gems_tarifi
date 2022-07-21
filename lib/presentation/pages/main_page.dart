import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gems_tarifi/presentation/pages/content_page.dart';
import 'package:gems_tarifi/presentation/pages/favorite_page.dart';
import 'package:gems_tarifi/presentation/pages/settings_page.dart';
import 'package:gems_tarifi/provider/main_app_state.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  final List _mainPages = [
    ContentPage(),
    FavoritePage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        child: _mainPages[context.watch<MainAppState>().getSelectedIndex],
        switchInCurve: Curves.easeInCubic,
        switchOutCurve: Curves.easeOutCubic,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            label: 'Цитаты',
            icon: Icon(CupertinoIcons.list_bullet),
          ),
          BottomNavigationBarItem(
            label: 'Избранное',
            icon: Icon(CupertinoIcons.bookmark),
          ),
          BottomNavigationBarItem(
            label: 'Настройки',
            icon: Icon(CupertinoIcons.settings),
          ),
        ],
        selectedItemColor: Colors.brown[800],
        unselectedItemColor: Colors.grey,
        currentIndex: context.watch<MainAppState>().getSelectedIndex,
        onTap: context.read<MainAppState>().updateSelectedIndex,
      ),
    );
  }
}