import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gems_tarifi/application/state/main_app_state.dart';
import 'package:gems_tarifi/application/strings/app_strings.dart';
import 'package:gems_tarifi/application/themes/app_theme.dart';
import 'package:gems_tarifi/presentation/lists/app_settings_list.dart';
import 'package:gems_tarifi/presentation/lists/citation_favorites_list.dart';
import 'package:gems_tarifi/presentation/lists/citation_page_list.dart';
import 'package:gems_tarifi/presentation/lists/citations_list.dart';
import 'package:gems_tarifi/presentation/widgets/search_citation_delegate.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> _mainPages = [
    const CitationsList(),
    const CitationPageList(),
    const CitationFavoritesList(),
    const AppSettingsList(),
  ];

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final MainAppState mainAppState = Provider.of<MainAppState>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appName),
        actions: [
          mainAppState.getBottomItemIndex == 0
              ? IconButton(
                  onPressed: () {
                    showSearch(
                      context: context,
                      delegate: SearchCitationDelegate(
                        hintText: AppStrings.searchByCitations,
                      ),
                    );
                  },
                  icon: const Icon(CupertinoIcons.search),
                )
              : const SizedBox(),
        ],
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: _mainPages[mainAppState.getBottomItemIndex],
      ),
      floatingActionButton: mainAppState.getBottomItemIndex == 0
          ? FloatingActionButton.small(
              onPressed: () {
                mainAppState.setListDefaultItem();
              },
              backgroundColor: appColors.primaryColor,
              child: const Icon(CupertinoIcons.arrow_2_squarepath),
            )
          : const SizedBox(),
      bottomNavigationBar: MediaQuery(
        data: const MediaQueryData(
          viewPadding: EdgeInsets.only(bottom: 12),
        ),
        child: BottomNavigationBar(
          unselectedItemColor: appColors.defaultColor,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.collections),
              label: AppStrings.citations,
              tooltip: AppStrings.citations,
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.book),
              label: AppStrings.pages,
              tooltip: AppStrings.pages,
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.bookmark),
              label: AppStrings.bookmarks,
              tooltip: AppStrings.bookmarks,
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings),
              label: AppStrings.settings,
              tooltip: AppStrings.settings,
            ),
          ],
          currentIndex: mainAppState.getBottomItemIndex,
          onTap: (int? index) => mainAppState.changeBottomIndex = index!,
        ),
      ),
    );
  }
}
