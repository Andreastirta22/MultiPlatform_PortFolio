import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../theme_mode.dart';

class ThemeController extends ChangeNotifier {
  static const String _themeKey = 'selected_theme';

  PortfolioTheme _theme = PortfolioTheme.dark;
  PortfolioTheme get currentTheme => _theme;

  bool _initialized = false;
  bool get initialized => _initialized;

  Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(_themeKey);

    if (value != null) {
      _theme = PortfolioTheme.values.firstWhere(
        (e) => e.name == value,
        orElse: () => PortfolioTheme.dark,
      );
    }

    _initialized = true;
    notifyListeners();
  }

  Future<void> changeTheme(PortfolioTheme theme) async {
    if (_theme == theme) return;

    _theme = theme;
    notifyListeners();

    // non-blocking persistence (SAFE FOR LIFECYCLE)
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString(_themeKey, theme.name);
    });
  }
}
