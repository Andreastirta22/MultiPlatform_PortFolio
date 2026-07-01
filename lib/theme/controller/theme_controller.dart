import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../theme_mode.dart';

class ThemeController extends ChangeNotifier {
  static const String _themeKey = 'selected_theme';

  PortfolioTheme _theme = PortfolioTheme.dark;

  PortfolioTheme get currentTheme => _theme;

  Future<void> initialize() async {
    await loadTheme();
  }

  Future<void> changeTheme(PortfolioTheme theme) async {
    _theme = theme;

    notifyListeners();

    await saveTheme();
  }

  Future<void> saveTheme() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(_themeKey, _theme.name);
  }

  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();

    final value = prefs.getString(_themeKey);

    if (value == null) return;

    _theme = PortfolioTheme.values.firstWhere(
      (e) => e.name == value,

      orElse: () => PortfolioTheme.dark,
    );

    notifyListeners();
  }
}
