import 'package:flutter/material.dart';
import 'package:gems_tarifi/domain/constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AppSettingsState with ChangeNotifier {

  var mainSettingsBox = Hive.box(Constants.keyMainSettings);

  List<bool> _isSelected = [false, false, false, true];

  List<bool> get getIsSelected => _isSelected;

  int _toggleButtonIndex = 3;

  int get getToggleButtonIndex => _toggleButtonIndex;

  double _textSize = 20;

  double get getTextSize => _textSize;

  int _textColor = Color(0xff363636).value;

  int get getTextColor => _textColor;

  bool _isDefaultColor = false;

  bool get getIsDefaultColor => _isDefaultColor;

  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get getThemeMode => _themeMode;

  bool _isDarkTheme = false;

  bool get getIsDarkTheme => _isDarkTheme;

  final List<TextAlign> _textAlign = [
    TextAlign.left,
    TextAlign.center,
    TextAlign.right,
    TextAlign.justify,
  ];

  List<TextAlign> get getTextAlign => _textAlign;

  updateToggleTextLayout(int index) {
    _toggleButtonIndex = index;
    for (int i = 0; i < _isSelected.length; i++) {
      _isSelected[i] = i == _toggleButtonIndex;
    }
    mainSettingsBox.put(Constants.keyContentTextAlignIndex, _toggleButtonIndex);
    notifyListeners();
  }

  updateTextSizeValue(double newSizeValue) {
    _textSize = newSizeValue;
    notifyListeners();
  }

  saveValue(String key, double value) async {
    await mainSettingsBox.put(key, value);
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

  changeTheme(bool state) {
    _isDarkTheme = state;
    _themeMode = _isDarkTheme ? ThemeMode.dark : ThemeMode.system;
    mainSettingsBox.put(Constants.keyThemeMode, _isDarkTheme);
    notifyListeners();
  }

  initSettings() {
    _toggleButtonIndex = mainSettingsBox.get(Constants.keyContentTextAlignIndex) ?? 3;
    for (int i = 0; i < _isSelected.length; i++) {
      _isSelected[i] = i == _toggleButtonIndex;
    }
    //_textSize = mainSettingsBox.get(Constants.keyContentTextSize) ?? 18;
    _textColor = mainSettingsBox.get(Constants.keyContentTextColor) ?? Color(0xff363636).value;
    _isDefaultColor = mainSettingsBox.get(Constants.keyContentDefaultTextColor) ?? false;
    _isDarkTheme = mainSettingsBox.get(Constants.keyThemeMode) ?? false;
    _themeMode = _isDarkTheme ? ThemeMode.dark : ThemeMode.system;
  }
}
