import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gems_tarifi/domain/search_content_delegate.dart';
import 'package:gems_tarifi/domain/states/provider/main_app_state.dart';
import 'package:gems_tarifi/domain/theme/app_theme.dart';
import 'package:gems_tarifi/presentation/widgets/content_list.dart';
import 'package:provider/provider.dart';

class ContentPage extends StatelessWidget {
  ContentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          'assets/images/pearl_50.png',
          color: Colors.white,
          scale: 1.5,
        ),
        title: const Text(
          'Жемчужины Тарифи',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            splashRadius: 20,
            icon: Icon(
              CupertinoIcons.search,
            ),
            onPressed: () {
              showSearch(
                context: context,
                delegate: SearchContentDelegate(),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.mainAccentColor,
        mini: true,
        child: Center(
          child: Icon(
            CupertinoIcons.arrow_2_squarepath,
            color: Colors.white,
          ),
        ),
        onPressed: () {
          context.read<MainAppState>().toDefaultIndex();
        },
      ),
      body: CupertinoScrollbar(
        child: ContentList(),
      ),
    );
  }
}
