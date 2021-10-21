import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gems_tarifi/data/database_query.dart';
import 'package:gems_tarifi/widgets/content_item.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class FavoriteList extends StatelessWidget {
  FavoriteList({Key? key}) : super(key: key);

  final _databaseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: _databaseQuery.getFavoriteContent(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return snapshot.hasData
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
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.bookmark_border,
                        size: 150,
                        color: Colors.brown[100],
                      ),
                      const Text(
                        'Список избранного пуст',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}