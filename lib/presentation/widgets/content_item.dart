import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:gems_tarifi/data/model/content_model_item.dart';
import 'package:gems_tarifi/presentation/widgets/bottom_buttons.dart';

class ContentItem extends StatelessWidget {
  ContentItem({Key? key, required this.item}) : super(key: key);

  final ContentModelItem item;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: item.id.isOdd ? Colors.white : Colors.brown[50],
      elevation: 3,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Html(
              data: item.content,
              style: {
                '#': Style(
                    fontSize: FontSize(18),
                    color: Colors.black,
                    textAlign: TextAlign.justify,
                    padding: EdgeInsets.zero,
                    margin: EdgeInsets.zero),
              },
            ),
            const SizedBox(height: 8),
            const Divider(
              indent: 8,
              endIndent: 8,
              color: Colors.black,
            ),
            BottomButtons(item: item),
          ],
        ),
      ),
    );
  }
}
