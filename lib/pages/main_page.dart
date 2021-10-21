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
      body: _mainPages[context.watch<BottomNavigationState>().getSelectedIndex],
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
        unselectedItemColor: Colors.grey[700],
        currentIndex: context.watch<BottomNavigationState>().getSelectedIndex,
        onTap: context.read<BottomNavigationState>().updateSelectedIndex,
      ),
    );
  }
}