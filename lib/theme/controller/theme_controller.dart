import 'package:flutter/material.dart';
import 'package:portfolio/theme/theme_mode.dart';

class ThemeController extends ChangeNotifier {
  PortfolioTheme currentTheme = PortfolioTheme.dark;

  void changeTheme(PortfolioTheme theme) {
    currentTheme = theme;
    notifyListeners();
  }
}
