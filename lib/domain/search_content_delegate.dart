import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gems_tarifi/data/model/content_model_item.dart';
import 'package:gems_tarifi/domain/states/provider/main_app_state.dart';
import 'package:gems_tarifi/domain/theme/app_theme.dart';
import 'package:gems_tarifi/presentation/widgets/content_item.dart';
import 'package:provider/provider.dart';

class SearchContentDelegate extends SearchDelegate {
  List<ContentModelItem> contents = [];
  List<ContentModelItem> recentContents = [];

  SearchContentDelegate({
    String hintText = 'Поиск цитаты...',
  }) : super(
          searchFieldLabel: hintText,
          keyboardType: TextInputType.text,
        );

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      query.isNotEmpty
          ? IconButton(
              icon: AnimatedIcon(
                icon: AnimatedIcons.menu_close,
                color: Theme.of(context).colorScheme.mainAccentColor,
                progress: transitionAnimation,
              ),
              onPressed: () {
                query = '';
              },
            )
          : const SizedBox(),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        color: Theme.of(context).colorScheme.mainAccentColor,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List>(
      future: context.watch<MainAppState>().getDatabaseQuery.getAllContent(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          contents = snapshot.data;
          recentContents = query.isEmpty
              ? contents
              : contents
                  .where((element) => element.content
                      .toLowerCase()
                      .contains(query.toLowerCase()))
                  .toList();
          return recentContents.isEmpty
              ? Center(
                  child: Text(
                    'По запросу $query ничего не найдено',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              : CupertinoScrollbar(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: recentContents.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ContentItem(
                        item: recentContents[index],
                      );
                    },
                  ),
                );
        } else {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List>(
      future: context.watch<MainAppState>().getDatabaseQuery.getAllContent(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          contents = snapshot.data;
          recentContents = query.isEmpty
              ? contents
              : contents
                  .where((element) => element.content
                      .toLowerCase()
                      .contains(query.toLowerCase()))
                  .toList();
          return recentContents.isEmpty
              ? Center(
                  child: Text(
                    'По запросу $query ничего не найдено',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              : CupertinoScrollbar(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: recentContents.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ContentItem(
                        item: recentContents[index],
                      );
                    },
                  ),
                );
        } else {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
      },
    );
  }
}
