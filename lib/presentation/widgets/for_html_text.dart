import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:gems_tarifi/application/state/content_settings_state.dart';
import 'package:gems_tarifi/application/styles/app_styles.dart';
import 'package:provider/provider.dart';

class ForHtmlText extends StatelessWidget {
  const ForHtmlText({super.key, required this.citation});

  final String citation;

  @override
  Widget build(BuildContext context) {
    final ContentSettingsState settings =
        Provider.of<ContentSettingsState>(context);
    final ThemeData appTheme = Theme.of(context);
    return Html(
      data: citation,
      style: {
        '#': Style(
          margin: Margins.zero,
          padding: HtmlPaddings.zero,
          fontFamily: AppStyles.getFont[settings.getFontIndex],
          textAlign: AppStyles.getAlign[settings.getTextAlignIndex],
          fontSize: FontSize(settings.getTextSize),
          color: appTheme.brightness == Brightness.light
              ? settings.getLightTextColor
              : settings.getDarkTextColor,
        ),
        'small': Style(
          fontSize: FontSize(14),
          color: Colors.grey,
        ),
      },
    );
  }
}
