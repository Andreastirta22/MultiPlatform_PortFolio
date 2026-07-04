import 'package:flutter/material.dart';
import 'package:portfolio/theme/tokens/visual_tokens.dart';

import '../app_theme_config.dart';
import '../tokens/color_tokens.dart';
import '../tokens/motion_tokens.dart';
import '../tokens/radius_tokens.dart';
import '../tokens/spacing_tokens.dart';
import '../tokens/typography_tokens.dart';

class EditorialTheme implements AppThemeConfig {
  @override
  ColorTokens get colors => const ColorTokens(
    background: Color(0xFFFAF7F0),
    surface: Color(0xFFFFFFFF),
    accent: Color(0xFF3E2723),
    border: Color(0xFFE6E0D6),
    textPrimary: Color(0xFF111111),
    textSecondary: Color(0xFF6B6B6B),
    transparent: Colors.transparent,
  );

  @override
  VisualTokens get visuals => const VisualTokens(
    glass: false,
    outlined: true,
    blur: 0,
    elevation: 0,
    navbarRadius: 0,
    cardRadius: 0,
  );

  @override
  SpacingTokens get spacing =>
      const SpacingTokens(xs: 4, sm: 8, md: 16, lg: 28, xl: 48, xxl: 80);

  @override
  RadiusTokens get radius =>
      const RadiusTokens(small: 0, medium: 0, large: 0, extraLarge: 0, full: 0);

  @override
  TypographyTokens get typography => const TypographyTokens(
    display: 72,
    headline: 44,
    title: 28,
    body: 18,
    caption: 13,
  );

  @override
  MotionTokens get motion => const MotionTokens(
    fast: Duration(milliseconds: 220),
    normal: Duration(milliseconds: 380),
    slow: Duration(milliseconds: 650),
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
      onSurface: colors.textPrimary,
    ),
    textTheme: TextTheme(
      labelMedium: TextStyle(
        fontSize: typography.caption,
        fontWeight: FontWeight.w600,
        letterSpacing: 4,
        color: colors.textSecondary,
      ),
      bodyMedium: TextStyle(
        fontSize: typography.body,
        height: 1.7,
        color: colors.textSecondary,
      ),
      headlineMedium: TextStyle(
        fontSize: typography.title,
        fontWeight: FontWeight.w600,
        height: 1.2,
        letterSpacing: -0.5,
        color: colors.textPrimary,
      ),
      displaySmall: TextStyle(
        fontSize: typography.headline,
        fontWeight: FontWeight.w400,
        height: 1.15,
        letterSpacing: -1,
        color: colors.textPrimary,
      ),
    ),
  );
}
