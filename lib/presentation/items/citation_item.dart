import 'package:flutter/material.dart';
import 'package:gems_tarifi/domain/models/citation_model.dart';
import 'package:gems_tarifi/presentation/widgets/for_html_text.dart';
import 'package:gems_tarifi/presentation/widgets/item_buttons.dart';

class CitationItem extends StatelessWidget {
  const CitationItem({
    super.key,
    required this.model,
    required this.index,
  });

  final CitationModel model;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      elevation: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              top: 16,
              right: 16,
            ),
            child: ForHtmlText(
              citation: model.citation,
            ),
          ),
          const Divider(indent: 16, endIndent: 16),
          ItemButtons(model: model, key: key),
          const SizedBox(height: 4),
        ],
      ),
    );
  }
}
