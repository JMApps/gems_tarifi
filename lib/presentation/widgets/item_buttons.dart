import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gems_tarifi/application/state/main_app_state.dart';
import 'package:gems_tarifi/application/strings/app_strings.dart';
import 'package:gems_tarifi/application/themes/app_theme.dart';
import 'package:gems_tarifi/domain/models/citation_model.dart';
import 'package:gems_tarifi/presentation/widgets/message_snackbar.dart';
import 'package:provider/provider.dart';

class ItemButtons extends StatelessWidget {
  const ItemButtons({super.key, required this.model});

  final CitationModel model;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final MainAppState mainAppState = Provider.of<MainAppState>(context);
    bool isBookmark = mainAppState.citationIsFavorite(model.id);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleAvatar(
          backgroundColor: appColors.circleIdColor,
          child: Text(
            model.id.toString(),
            style: const TextStyle(
              fontSize: 18,
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            mainAppState.copyCitation(model.citation);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(milliseconds: 350),
                backgroundColor: appColors.primaryColor,
                content: const MessageSnackBar(
                  message: AppStrings.copied,
                ),
              ),
            );
          },
          splashRadius: 20,
          icon: const Icon(
            CupertinoIcons.doc_on_doc,
          ),
        ),
        IconButton(
          onPressed: () {
            mainAppState.shareCitation(model.citation);
          },
          splashRadius: 20,
          icon: const Icon(
            CupertinoIcons.share,
          ),
        ),
        IconButton(
          onPressed: () {
            mainAppState.takeScreenshot(model);
          },
          splashRadius: 20,
          icon: const Icon(
            CupertinoIcons.photo_on_rectangle,
          ),
        ),
        IconButton(
          onPressed: () {
            mainAppState.toggleFavoriteState(model.id);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(milliseconds: 350),
                backgroundColor: appColors.primaryColor,
                content: MessageSnackBar(
                  message: isBookmark ? AppStrings.removed : AppStrings.added,
                ),
              ),
            );
          },
          splashRadius: 20,
          icon: Icon(
            isBookmark
                ? CupertinoIcons.bookmark_solid
                : CupertinoIcons.bookmark,
            color: appColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
