import 'package:portfolio/theme/app_theme_config.dart';
import 'package:portfolio/theme/theme_mode.dart';
import 'package:portfolio/theme/theme_registry.dart';

class AppTheme {
  static AppThemeConfig resolve(PortfolioTheme theme) {
    return ThemeRegistry.getTheme(theme);
  }
}
