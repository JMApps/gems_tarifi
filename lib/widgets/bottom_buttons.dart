import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gems_tarifi/model/content_model_item.dart';
import 'package:share/share.dart';

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
            color: Colors.blue,
            scale: 1.8,
          ),
          label: Text(
            '– ${item.id}',
            style: const TextStyle(fontSize: 18, color: Colors.blue),
          ),
        ),
        IconButton(
            icon: const Icon(
              CupertinoIcons.doc_on_doc,
              color: Colors.blue,
            ),
            onPressed: () {
              FlutterClipboard.copy(
                  '${item.contentForShare}\n\n‘Абду-ль-‘Азиз ат-Тарифи');
              _showSnackBar(context, true);
            }),
        IconButton(
          icon: const Icon(
            CupertinoIcons.arrowshape_turn_up_right,
            color: Colors.blue,
          ),
          onPressed: () {
            Share.share('${item.contentForShare}\n\n‘Абду-ль-‘Азиз ат-Тарифи');
          },
        ),
        IconButton(
          icon: const Icon(
            Icons.photo_library_outlined,
            color: Colors.blue,
          ),
          onPressed: () {
          },
        ),
        IconButton(
          icon: Icon(item.favorite == 0
                  ? CupertinoIcons.bookmark
                  : CupertinoIcons.bookmark_fill, color: Colors.blue),
          onPressed: () {
            _showSnackBar(context, false);
          },
        )
      ],
    );
  }

  _showSnackBar(BuildContext context, bool copy) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          copy
              ? 'Скопировано'
              : item.favorite == 0
                  ? 'Добавлено'
                  : 'Удалено',
          style: TextStyle(fontSize: 18),
        ),
        duration: Duration(milliseconds: 500),
      ),
    );
  }
}
