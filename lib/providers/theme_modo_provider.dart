import 'package:calory_tracker/constants/user_constants.dart';
import 'package:calory_tracker/helpers/preference.dart';
import 'package:flutter/material.dart';

//Aqui guardare la seleccion del tema
class ThemeSelectProvider extends ChangeNotifier {
  late ThemeMode theme;

  ThemeSelectProvider() {
    theme = ThemeMode.dark;
    loadTheme();
  }

  void changeMode() {
    if (theme == ThemeMode.dark) {
      setLightTheme();
      saveTheme(true);
    } else {
      setDarkTheme();
      saveTheme(false);
    }
    notifyListeners();
  }

  void setDarkTheme() {
    theme = ThemeMode.dark;
  }

  void setLightTheme() {
    theme = ThemeMode.light;
  }

  Future<void> saveTheme(bool value) async {
    await PreferenceUtils.setBool(UserConstants.themeSelect, value);
  }

  void loadTheme() async {
    final themeSelect = await PreferenceUtils.getBool(UserConstants.themeSelect);
    if (themeSelect == false) {
      setDarkTheme();
    } else {
      setLightTheme();
    }
  }

  bool getThemeBool() {
    return theme == ThemeMode.dark;
  }
}