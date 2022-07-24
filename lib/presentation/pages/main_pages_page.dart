import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gems_tarifi/domain/states/provider/main_app_state.dart';
import 'package:gems_tarifi/domain/theme/app_theme.dart';
import 'package:gems_tarifi/presentation/pages/content_page.dart';
import 'package:gems_tarifi/presentation/pages/favorite_page.dart';
import 'package:gems_tarifi/presentation/pages/settings_page.dart';
import 'package:gems_tarifi/presentation/widgets/to_citation.dart';
import 'package:provider/provider.dart';

class MainPagesPage extends StatelessWidget {
  MainPagesPage({Key? key}) : super(key: key);

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
          BottomNavigationBarItem(
            label: 'К цитате',
            icon: Icon(CupertinoIcons.arrow_turn_up_right),
          ),
        ],
        selectedItemColor: Theme.of(context).colorScheme.mainAccentColor,
        unselectedItemColor: Colors.grey,
        currentIndex: context.watch<MainAppState>().getSelectedIndex,
        onTap: (index) {
          if (index < 3) {
            context.read<MainAppState>().updateSelectedIndex(index);
          }
          if (index == 3) {
            showCupertinoModalPopup(
              context: context,
              builder: (BuildContext context) {
                return Center(
                  child: Container(
                    margin: const EdgeInsets.all(16),
                    child: ToCitation(),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
