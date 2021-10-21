import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gems_tarifi/data/database_query.dart';
import 'package:gems_tarifi/widgets/category_item.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class CategoryList extends StatelessWidget {
  CategoryList({Key? key}) : super(key: key);

  final _databaseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: _databaseQuery.getFavoriteContent(),
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
                        'В данной категории нет содержимого',
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
                        return CategoryItem(item: snapshot.data![index]);
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
