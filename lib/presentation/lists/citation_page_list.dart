import 'package:flutter/material.dart';
import 'package:gems_tarifi/application/state/main_app_state.dart';
import 'package:gems_tarifi/application/styles/app_styles.dart';
import 'package:gems_tarifi/application/themes/app_theme.dart';
import 'package:gems_tarifi/data/local/databases/database_helper.dart';
import 'package:gems_tarifi/domain/models/citation_model.dart';
import 'package:gems_tarifi/presentation/items/citation_page_item.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CitationPageList extends StatefulWidget {
  const CitationPageList({super.key});

  @override
  State<CitationPageList> createState() => _CitationPageListState();
}

class _CitationPageListState extends State<CitationPageList> {

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final MainAppState mainAppState = Provider.of<MainAppState>(context);
    return FutureBuilder<List<CitationModel>>(
      future: DatabaseHelper().getAllCitations(),
      builder: (BuildContext context, AsyncSnapshot<List<CitationModel>> snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: mainAppState.getPageController,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    final CitationModel model = snapshot.data![index];
                    return CitationPageItem(
                      model: model,
                      index: index,
                    );
                  },
                  onPageChanged: (int? page) {
                    mainAppState.saveCurrentPage = page!;
                  },
                ),
              ),
              SmoothPageIndicator(
                controller: mainAppState.getPageController,
                count: snapshot.data!.length,
                effect: ScrollingDotsEffect(
                  dotHeight: 12,
                  dotWidth: 12,
                  activeDotColor: appColors.primaryColor,
                  fixedCenter: true,
                ),
              ),
              const SizedBox(height: 16),
            ],
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
