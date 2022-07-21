import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:gems_tarifi/data/model/content_model_item.dart';
import 'package:gems_tarifi/domain/states/provider/app_settings_state.dart';
import 'package:gems_tarifi/domain/theme/app_theme.dart';
import 'package:gems_tarifi/presentation/widgets/bottom_buttons.dart';
import 'package:provider/provider.dart';

class FavoriteItem extends StatelessWidget {
  FavoriteItem({Key? key, required this.item}) : super(key: key);

  final ContentModelItem item;

  @override
  Widget build(BuildContext context) {
    final myColor = Theme.of(context).colorScheme;
    return Card(
      color: item.id.isOdd ? Colors.white : Colors.brown[50],
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Html(
              data: item.content,
              style: {
                '#': Style(
                    fontSize: FontSize(context.watch<AppSettingsState>().getTextSize),
                    color: context.watch<AppSettingsState>().getIsDefaultColor ? Color(context.watch<AppSettingsState>().getTextColor) : myColor.mainTextColor,
                    textAlign: context.watch<AppSettingsState>().getTextAlign[context.watch<AppSettingsState>().getToggleButtonIndex],
                    padding: EdgeInsets.zero,
                    margin: EdgeInsets.zero),
              },
            ),
            const SizedBox(height: 8),
            const Divider(
              indent: 16,
              endIndent: 16,
              color: Colors.grey,
            ),
            BottomButtons(item: item),
          ],
        ),
      ),
    );
  }
}
