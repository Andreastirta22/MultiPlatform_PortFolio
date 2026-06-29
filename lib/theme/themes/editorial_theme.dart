import 'package:flutter/material.dart';

import '../app_theme_config.dart';
import '../tokens/color_tokens.dart';
import '../tokens/motion_tokens.dart';
import '../tokens/radius_tokens.dart';
import '../tokens/spacing_tokens.dart';
import '../tokens/typography_tokens.dart';

class EditorialTheme implements AppThemeConfig {
  @override
  ColorTokens get colors => const ColorTokens(
    background: Color(0xFFF7F3EB),

    surface: Color(0xFFFFFFFF),

    accent: Color(0xFF6D4C41),

    border: Color(0xFFD8D2C7),

    textPrimary: Color(0xFF1E1E1E),

    textSecondary: Color(0xFF646464),
  );

  @override
  SpacingTokens get spacing =>
      const SpacingTokens(xs: 4, sm: 8, md: 16, lg: 24, xl: 40, xxl: 64);

  @override
  RadiusTokens get radius =>
      const RadiusTokens(small: 0, medium: 0, large: 0, extraLarge: 0);

  @override
  TypographyTokens get typography => const TypographyTokens(
    display: 64,

    headline: 42,

    title: 28,

    body: 18,

    caption: 14,
  );

  @override
  MotionTokens get motion => const MotionTokens(
    fast: Duration(milliseconds: 200),

    normal: Duration(milliseconds: 350),

    slow: Duration(milliseconds: 600),
  );

  @override
  ThemeData get theme => ThemeData(
    scaffoldBackgroundColor: colors.background,

    primaryColor: colors.accent,

    dividerColor: colors.border,

    colorScheme: ColorScheme.light(
      primary: colors.accent,

      surface: colors.surface,

      outline: colors.border,
    ),
  );
}
