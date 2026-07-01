import 'package:portfolio/theme/app_theme.dart';

class ThemeState {
  final AppTheme theme;

  const ThemeState({required this.theme});

  ThemeState copyWidth({AppTheme? theme}) {
    return ThemeState(theme: theme ?? this.theme);
  }
}
