import 'package:flutter/material.dart';
import 'package:gems_tarifi/pages/category_page.dart';
import 'package:gems_tarifi/pages/content_page.dart';
import 'package:gems_tarifi/pages/favorite_page.dart';
import 'package:gems_tarifi/provider/bottom_navigation_state.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  final List _mainPages = [
    ContentPage(),
    FavoritePage(),
    CategoryPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        child: _mainPages[context.watch<BottomNavigationState>().getSelectedIndex],
        switchInCurve: Curves.easeInCubic,
        switchOutCurve: Curves.easeOutCubic,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: 'Цитаты',
            icon: Icon(Icons.view_headline_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Избранное',
            icon: Icon(Icons.bookmark),
          ),
          BottomNavigationBarItem(
            label: 'Категории',
            icon: Icon(Icons.category),
          ),
        ],
        selectedItemColor: Colors.brown[800],
        unselectedItemColor: Colors.grey,
        currentIndex: context.watch<BottomNavigationState>().getSelectedIndex,
        onTap: context.read<BottomNavigationState>().updateSelectedIndex,
      ),
    );
  }
}
