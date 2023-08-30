import 'package:flutter/material.dart';
import 'package:gems_tarifi/application/strings/app_strings.dart';
import 'package:gems_tarifi/application/styles/app_styles.dart';
import 'package:gems_tarifi/domain/models/citation_model.dart';
import 'package:html/parser.dart';

class CardScreenshot extends StatelessWidget {
  const CardScreenshot({
    super.key,
    required this.model,
  });

  final CitationModel model;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: AppStyles.mainShape,
      elevation: 2,
      child: Padding(
        padding: AppStyles.mainMarding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              _parseHtmlText(model.citation),
              style: const TextStyle(
                fontSize: 22,
                fontFamily: 'Nexa',
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            const Text(
              AppStrings.authorName,
              style: TextStyle(
                fontSize: 22,
                fontFamily: 'Nexa',
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  String _parseHtmlText(String htmlText) {
    final documentText = parse(htmlText);
    final String parsedString = parse(documentText.body!.text).documentElement!.text;
    return parsedString;
  }
}
