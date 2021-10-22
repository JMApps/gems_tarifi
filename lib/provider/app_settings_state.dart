import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettingsState with ChangeNotifier {

  double _textSize = 20;

  double get getTextSize => _textSize;

  Color _textColor = Colors.black54;

  Color get getArabicTextColor => _textColor;

  final List<bool> _isSelected = [true, false, false, false];

  int _toggleButtonIndex = 0;

  int get getToggleButtonIndex => _toggleButtonIndex;

  List<bool> get getIsSelected => _isSelected;

  updateTextSizeValue(double textSize) {
    _textSize = textSize;
    notifyListeners();
  }

  saveTextSizeValue(double lastSizeValue) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setDouble('key_text_size_value', lastSizeValue);
  }

  updateTextColor(Color newColor) {
    _textColor = newColor;
    notifyListeners();
  }

  saveTextColor(Color lastTextColor) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setInt('key_text_color_value', lastTextColor.value);
  }

  updateToggleTextLayout(int index) {
    _toggleButtonIndex = index;
    for (int i = 0; i < _isSelected.length; i++) {
      _isSelected[i] = i == _toggleButtonIndex;
    }
    saveToggleButtonIndex(index);
    notifyListeners();
  }

  saveToggleButtonIndex(int index) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setInt('key_toggle_button_index', index);
  }

  initPreferences() async {
    final preferences = await SharedPreferences.getInstance();
    _textSize = preferences.getDouble('key_text_size_value') ?? 20;
    _textColor = Color(preferences.getInt('key_text_color_value') ?? Colors.black54.value);
    _toggleButtonIndex = preferences.getInt("key_toggle_button_index") ?? 0;
    for (int i = 0; i < _isSelected.length; i++) {
      _isSelected[i] = i == _toggleButtonIndex;
    }
  }
}