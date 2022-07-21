import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gems_tarifi/data/model/content_model_item.dart';
import 'package:gems_tarifi/domain/states/provider/main_app_state.dart';
import 'package:gems_tarifi/domain/states/provider/take_screenshot_state.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({Key? key, required this.item}) : super(key: key);

  final ContentModelItem item;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton.icon(
          onPressed: null,
          icon: Image.asset(
            'assets/images/pearl_50.png',
            color: Colors.deepPurple,
            scale: 1.8,
          ),
          label: Text(
            '– ${item.id}',
            style: const TextStyle(fontSize: 18, color: Colors.deepPurple),
          ),
        ),
        IconButton(
            icon: Icon(
              CupertinoIcons.doc_on_doc,
              color: Colors.grey[600],
            ),
            onPressed: () {
              FlutterClipboard.copy(
                  '${item.contentForShare}\n\n‘Абду-ль-‘Азиз ат-Тарифи');
              _showSnackBar(context, true);
            }),
        IconButton(
          icon: Icon(
            CupertinoIcons.arrowshape_turn_up_right,
            color: Colors.grey[600],
          ),
          onPressed: () {
            Share.share('${item.contentForShare}\n\n‘Абду-ль-‘Азиз ат-Тарифи');
          },
        ),
        IconButton(
          icon: Icon(
            Icons.photo_library_outlined,
            color: Colors.grey[600],
          ),
          onPressed: () {
            context.read<TakeScreenshotState>().takeScreenshot(item);
          },
        ),
        IconButton(
          icon: Icon(
              item.favoriteState == 0
                  ? CupertinoIcons.bookmark
                  : CupertinoIcons.bookmark_fill,
              color: Colors.deepPurple),
          onPressed: () {
            context.read<MainAppState>().updateBookmarkState(
                  item.favoriteState == 0 ? 1 : 0,
                  item.id,
                );
            _showSnackBar(context, false);
          },
        )
      ],
    );
  }

  _showSnackBar(BuildContext context, bool copy) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.purple,
        content: Text(
          copy
              ? 'Скопировано'
              : item.favoriteState == 0
                  ? 'Добавлено'
                  : 'Удалено',
          style: TextStyle(fontSize: 18),
        ),
        duration: Duration(milliseconds: 500),
      ),
    );
  }
}