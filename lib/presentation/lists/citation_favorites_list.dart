import 'package:flutter/cupertino.dart';
import 'package:gems_tarifi/application/state/main_app_state.dart';
import 'package:gems_tarifi/application/strings/app_strings.dart';
import 'package:gems_tarifi/application/styles/app_styles.dart';
import 'package:gems_tarifi/data/local/databases/database_helper.dart';
import 'package:gems_tarifi/domain/models/citation_model.dart';
import 'package:gems_tarifi/presentation/items/citation_item.dart';
import 'package:provider/provider.dart';

class CitationFavoritesList extends StatefulWidget {
  const CitationFavoritesList({super.key});

  @override
  State<CitationFavoritesList> createState() => _CitationFavoritesListState();
}

class _CitationFavoritesListState extends State<CitationFavoritesList> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final MainAppState mainAppState = Provider.of<MainAppState>(context);
    return FutureBuilder<List<CitationModel>>(
      future: DatabaseHelper().getFavoriteSupplications(favorites: mainAppState.getFavoriteCitationsList),
      builder: (BuildContext context, AsyncSnapshot<List<CitationModel>> snapshot) {
        if (snapshot.hasData) {
          return CupertinoScrollbar(
            controller: _scrollController,
            child: ListView.builder(
              controller: _scrollController,
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
            ),
          );
        } else {
          return const Center(
            child: Padding(
              padding: AppStyles.mainMarding,
              child: Text(
                AppStrings.bookmarksIsEmpty,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
