import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gems_tarifi/data/database_query.dart';
import 'package:gems_tarifi/provider/search_state.dart';
import 'package:gems_tarifi/widgets/content_item.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ContentList extends StatelessWidget {
  ContentList({Key? key}) : super(key: key);

  final _databaseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: context.watch<SearchState>().getSearchContent.isNotEmpty
          ? _databaseQuery.getContentSearchResult(context.read<SearchState>().getSearchContent)
          : _databaseQuery.getAllContent(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return snapshot.hasError
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error,
                        size: 150,
                        color: Colors.brown[100],
                      ),
                      const Text(
                        'По вашему запросу ничего не найдено',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              )
            : snapshot.hasData
                ? Scrollbar(
                    child: ScrollablePositionedList.builder(
                      //itemScrollController: _itemScrollController,
                      physics: BouncingScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ContentItem(item: snapshot.data![index]);
                      },
                    ),
                  )
                : Center(
                    child: Platform.isAndroid
                        ? const CircularProgressIndicator()
                        : const CupertinoActivityIndicator(),
                  );
      },
    );
  }
}
