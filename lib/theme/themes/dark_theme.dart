import 'package:flutter/material.dart';
import 'package:portfolio/theme/app_theme_config.dart';
import 'package:portfolio/theme/tokens/color_tokens.dart';
import 'package:portfolio/theme/tokens/motion_tokens.dart';
import 'package:portfolio/theme/tokens/radius_tokens.dart';
import 'package:portfolio/theme/tokens/spacing_tokens.dart';
import 'package:portfolio/theme/tokens/typography_tokens.dart';

class DarkTheme implements AppThemeConfig {
  @override
  ColorTokens get colors => const ColorTokens(
    background: Color(0xFF0E0E10),

    surface: Color(0xFF1A1A1E),

    accent: Color(0xFFFF7A18),

    border: Color(0xFF2C2C30),

    textPrimary: Color(0xFFF5F5F7),

    textSecondary: Color(0xFF9A9AA1),
  );

  @override
  SpacingTokens get spacing =>
      const SpacingTokens(xs: 4, sm: 8, md: 16, lg: 24, xl: 32, xxl: 48);

  @override
  RadiusTokens get radius =>
      const RadiusTokens(small: 8, medium: 12, large: 20, extraLarge: 28);

  @override
  TypographyTokens get typography => const TypographyTokens(
    display: 56,
    headline: 36,
    title: 24,
    body: 16,
    caption: 14,
  );

  @override
  MotionTokens get motion => const MotionTokens(
    fast: Duration(milliseconds: 150),
    normal: Duration(milliseconds: 300),
    slow: Duration(milliseconds: 500),
  );

  @override
  ThemeData get theme => ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: colors.background,
    primaryColor: colors.accent,
    cardColor: colors.surface,
    dividerColor: colors.border,
    colorScheme: ColorScheme.dark(
      primary: colors.accent,
      surface: colors.surface,
      outline: colors.border,
    ),
  );
}
