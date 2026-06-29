import 'package:portfolio/theme/themes/editorial_theme.dart';
import 'package:portfolio/theme/themes/minimal_theme.dart';
import 'package:portfolio/theme/themes/neo_theme.dart';
import 'package:portfolio/theme/themes/xp_theme.dart';

import 'app_theme_config.dart';
import 'theme_mode.dart';
import 'themes/dark_theme.dart';

class ThemeRegistry {
  static AppThemeConfig getTheme(PortfolioTheme theme) {
    switch (theme) {
      case PortfolioTheme.dark:
        return DarkTheme();

      case PortfolioTheme.editorial:
        return EditorialTheme();

      case PortfolioTheme.minimal:
        return MinimalTheme();

      case PortfolioTheme.neo:
        return NeoTheme();

      case PortfolioTheme.xp:
        return XPTheme();
    }
  }
}
