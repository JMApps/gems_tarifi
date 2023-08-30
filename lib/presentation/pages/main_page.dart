import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gems_tarifi/application/state/main_app_state.dart';
import 'package:gems_tarifi/application/strings/app_strings.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final MainAppState mainAppState = Provider.of<MainAppState>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appName),
      ),
      body: Container(),
      bottomNavigationBar: MediaQuery(
        data: const MediaQueryData(
          viewPadding: EdgeInsets.only(bottom: 12),
        ),
        child: BottomNavigationBar(
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.collections),
              label: AppStrings.citations,
              tooltip: AppStrings.citations,
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
