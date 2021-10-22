import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gems_tarifi/provider/app_settings_state.dart';
import 'package:o_color_picker/o_color_picker.dart';
import 'package:provider/provider.dart';

class AppSettings extends StatelessWidget {
  const AppSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          margin: const EdgeInsets.all(16),
          child: Container(
            width: double.infinity,
            child: Material(
              borderRadius: const BorderRadius.all(
                Radius.circular(25),
              ),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        'Размер текста',
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 10,
                          child: CupertinoSlider(
                            activeColor: Colors.blue,
                            min: 14,
                            max: 40,
                            value:
                                context.watch<AppSettingsState>().getTextSize,
                            onChanged: (value) {
                              context
                                  .read<AppSettingsState>()
                                  .updateTextSizeValue(value);
                            },
                            onChangeEnd: (value) {
                              context
                                  .read<AppSettingsState>()
                                  .saveTextSizeValue(value);
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Flexible(
                          flex: 1,
                          child: Text(
                            '${context.watch<AppSettingsState>().getTextSize.toInt()}',
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                    const Divider(indent: 16, endIndent: 16),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(
                        Icons.palette_outlined,
                        color: context
                            .watch<AppSettingsState>()
                            .getArabicTextColor,
                      ),
                      title: const Text(
                        'Цвет текста',
                        style: TextStyle(fontSize: 18),
                      ),
                      trailing: Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: context
                              .watch<AppSettingsState>()
                              .getArabicTextColor,
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(25),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(25),
                                  ),
                                ),
                                content: OColorPicker(
                                  selectedColor: context
                                      .watch<AppSettingsState>()
                                      .getArabicTextColor,
                                  colors: primaryColorsPalette,
                                  onColorChange: (color) {
                                    context
                                        .read<AppSettingsState>()
                                        .updateTextColor(color);
                                    context
                                        .read<AppSettingsState>()
                                        .saveTextColor(color);
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const Divider(indent: 16, endIndent: 16),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8, top: 16, right: 8, bottom: 16),
                      child: Text(
                        'Расположение текста',
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    Center(
                      child: ToggleButtons(
                        children: <Widget>[
                          Icon(Icons.format_align_left),
                          Icon(Icons.format_align_center),
                          Icon(Icons.format_align_right),
                          Icon(Icons.format_align_justify),
                        ],
                        isSelected: context.watch<AppSettingsState>().getIsSelected,
                        onPressed: (index) {
                          context.read<AppSettingsState>().updateToggleTextLayout(index);
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Divider(indent: 16, endIndent: 16),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
