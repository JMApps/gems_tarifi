import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class ForHtmlText extends StatelessWidget {
  const ForHtmlText({super.key, required this.citation});

  final String citation;

  @override
  Widget build(BuildContext context) {
    return Html(
      data: citation,
      style: {
        '#': Style(
          margin: Margins.zero,
          padding: HtmlPaddings.zero,
          fontFamily: 'Nexa',
          textAlign: TextAlign.start,
          fontSize: FontSize(18),
        ),
        'small': Style(
          fontSize: FontSize(14),
          color: Colors.grey,
        ),
      },
    );
  }
}
