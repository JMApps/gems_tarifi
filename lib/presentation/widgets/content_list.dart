import 'package:flutter/material.dart';
import 'package:gems_tarifi/domain/states/provider/main_app_state.dart';
import 'package:gems_tarifi/presentation/widgets/content_item.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ContentList extends StatelessWidget {
  ContentList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: context.watch<MainAppState>().getDatabaseQuery.getAllContent(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ScrollablePositionedList.builder(
                itemScrollController: context.read<MainAppState>().getScrollPositioned,
                physics: const BouncingScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return ContentItem(item: snapshot.data![index]);
                },
              )
            : Center(
                child: const CircularProgressIndicator.adaptive(),
              );
      },
    );
  }
}
