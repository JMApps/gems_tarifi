import 'package:flutter/material.dart';
import 'package:gems_tarifi/application/state/main_app_state.dart';
import 'package:gems_tarifi/application/styles/app_styles.dart';
import 'package:gems_tarifi/data/local/databases/database_helper.dart';
import 'package:gems_tarifi/domain/models/citation_model.dart';
import 'package:gems_tarifi/presentation/items/citation_item.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class CitationsList extends StatelessWidget {
  const CitationsList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CitationModel>>(
      future: DatabaseHelper().getAllCitations(),
      builder: (BuildContext context, AsyncSnapshot<List<CitationModel>> snapshot) {
        if (snapshot.hasData) {
          return ScrollablePositionedList.builder(
            itemScrollController: context.watch<MainAppState>().getItemScrollController,
            padding: const EdgeInsets.only(
              left: 8,
              top: 8,
              right: 8,
            ),
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              final CitationModel model = snapshot.data![index];
              return CitationItem(
                model: model,
                index: index,
              );
            },
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Padding(
              padding: AppStyles.mainMarding,
              child: Text(
                snapshot.hasError.toString(),
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.red,
                ),
                textAlign: TextAlign.center,
              ),
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
