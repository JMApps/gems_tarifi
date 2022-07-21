import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gems_tarifi/domain/constants.dart';
import 'package:gems_tarifi/domain/states/provider/app_settings_state.dart';
import 'package:gems_tarifi/domain/theme/app_theme.dart';
import 'package:o_color_picker/o_color_picker.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myColor = Theme.of(context).colorScheme;
    return Consumer<AppSettingsState>(
      builder: (context, appSettings, _) {
        return Container(
          padding: EdgeInsets.all(16),
          child: ListView(
            children: [
              const Text(
                'Расположение текста',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 16),
              Center(
                child: ToggleButtons(
                  color: myColor.mainAccentColor,
                  selectedColor: myColor.mainAccentColor,
                  borderRadius: BorderRadius.circular(15),
                  isSelected: appSettings.getIsSelected,
                  onPressed: (index) => appSettings.updateToggleTextLayout(index),
                  children: const [
                    Icon(CupertinoIcons.text_alignleft),
                    Icon(CupertinoIcons.text_aligncenter),
                    Icon(CupertinoIcons.text_alignright),
                    Icon(CupertinoIcons.text_justify),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              const Divider(color: Colors.grey),
              const SizedBox(height: 8),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(CupertinoIcons.textformat_size),
                title: const Text(
                  'Размер текста',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.start,
                ),
                subtitle: Slider.adaptive(
                  activeColor: myColor.mainAccentColor,
                  min: 14,
                  max: 50,
                  value: context.watch<AppSettingsState>().getTextSize,
                  onChanged: (currentTextSize) {
                    appSettings.updateTextSizeValue(currentTextSize);
                    appSettings.saveValue(Constants.keyContentTextSize, currentTextSize);
                  },
                  onChangeEnd: (lastTextSizeValue) {

                  },
                ),
                trailing: Text(
                  '${appSettings.getTextSize.toInt()}',
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              const Divider(color: Colors.grey),
              const SizedBox(height: 8),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(
                  Icons.palette_outlined,
                  color: myColor.mainTextColor,
                ),
                title: const Text(
                  'Цвет текста',
                  style: TextStyle(fontSize: 18),
                ),
                trailing: InkWell(
                  borderRadius: BorderRadius.circular(25),
                  child: Icon(
                    Icons.palette,
                    size: 35,
                    color: Color(appSettings.getTextColor)
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        content: OColorPicker(
                          selectedColor: Color(appSettings.getTextColor),
                          colors: primaryColorsPalette,
                          onColorChange: (color) {
                            appSettings.updateTextColor(color);
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              const Divider(color: Colors.grey),
              const SizedBox(height: 8),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.invert_colors),
                title: const Text(
                  'Выбранный цвет для светлой и ночной темы',
                  style: TextStyle(fontSize: 18),
                ),
                trailing: Switch.adaptive(
                  activeColor: myColor.mainAccentColor,
                  value: appSettings.getIsDefaultColor,
                  onChanged: (value) {
                    appSettings.updateDefaultColorState(value);
                  },
                ),
              ),
              const SizedBox(height: 8),
              const Divider(),
              SwitchListTile.adaptive(
                activeColor: myColor.mainAccentColor,
                title: const Text(
                  'Тема',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text(
                  'Светлая и ночная (в выключенном состоянии адаптивная)',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                value: appSettings.getIsDarkTheme,
                onChanged: (value) {
                  appSettings.changeTheme(value);
                },
              ),
              const Divider(color: Colors.grey),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }
}
