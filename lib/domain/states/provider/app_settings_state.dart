import 'package:flutter/material.dart';
import 'package:gems_tarifi/domain/constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AppSettingsState with ChangeNotifier {

  var mainSettingsBox = Hive.box(Constants.keyMainSettings);

  ThemeMode themeMode = ThemeMode.system;

  ThemeMode get getThemeMode => themeMode;

  bool isDarkTheme = false;

  double _textSize = 20;

  double get getTextSize => _textSize;

  int _textColor = Color(0xff363636).value;

  int get getTextColor => _textColor;

  bool _isDefaultColor = false;

  bool get getIsDefaultColor => _isDefaultColor;

  final List<bool> _isSelected = [false, false, false, true];

  int _toggleButtonIndex = 3;

  int get getToggleButtonIndex => _toggleButtonIndex;

  List<bool> get getIsSelected => _isSelected;

  final List<TextAlign> _textAlign = [
    TextAlign.left,
    TextAlign.center,
    TextAlign.right,
    TextAlign.justify,
  ];

  List<TextAlign> get getTextAlign => _textAlign;

  changeTheme(bool state) {
    isDarkTheme = state;
    isDarkTheme ? themeMode = ThemeMode.dark : themeMode = ThemeMode.system;
    mainSettingsBox.put(Constants.keyThemeMode, state);
    notifyListeners();
  }

  updateTextSizeValue(double newSizeValue) {
    _textSize = newSizeValue;
    notifyListeners();
  }

  updateTextColor(Color newColor) {
    _textColor = newColor.value;
    mainSettingsBox.put(Constants.keyContentTextColor, newColor.value);
    notifyListeners();
  }

  updateDefaultColorState(bool state) {
    _isDefaultColor = state;
    mainSettingsBox.put(Constants.keyContentDefaultTextColor, state);
    notifyListeners();
  }

  updateToggleTextLayout(int index) {
    _toggleButtonIndex = index;
    for (int i = 0; i < _isSelected.length; i++) {
      _isSelected[i] = i == _toggleButtonIndex;
    }
    notifyListeners();
  }

  saveState(String key, var value) {
    mainSettingsBox.put(key, value);
    notifyListeners();
  }

  initPreferences() async {
    _textSize = mainSettingsBox.get(Constants.keyContentTextSize);
    _textColor = mainSettingsBox.get(Constants.keyContentTextColor);
    _isDefaultColor = mainSettingsBox.get(Constants.keyContentDefaultTextColor);
    _toggleButtonIndex = mainSettingsBox.get(Constants.keyContentTextAlignIndex);
    for (int i = 0; i < _isSelected.length; i++) {
      _isSelected[i] = i == _toggleButtonIndex;
    }
    themeMode = isDarkTheme ? ThemeMode.dark : ThemeMode.system;
  }
}
