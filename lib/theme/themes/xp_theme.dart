import 'package:flutter/material.dart';
import 'package:portfolio/theme/tokens/visual_tokens.dart';

import '../app_theme_config.dart';
import '../tokens/color_tokens.dart';
import '../tokens/motion_tokens.dart';
import '../tokens/radius_tokens.dart';
import '../tokens/spacing_tokens.dart';
import '../tokens/typography_tokens.dart';

class XPTheme implements AppThemeConfig {
  @override
  ColorTokens get colors => const ColorTokens(
    background: Color(0xFF2B579A),
    surface: Color(0xFFEAF1FB),
    accent: Color(0xFFFFC83D),
    border: Color(0xFF1E3A6D),
    textPrimary: Color(0xFF0B0B0B),
    textSecondary: Color(0xFF2F2F2F),
    transparent: Colors.transparent,
  );

  @override
  VisualTokens get visuals => const VisualTokens(
    glass: false,
    outlined: true,
    blur: 0,
    elevation: 6,
    navbarRadius: 2,
    cardRadius: 2,
  );

  @override
  SpacingTokens get spacing =>
      const SpacingTokens(xs: 4, sm: 6, md: 12, lg: 16, xl: 24, xxl: 32);

  @override
  RadiusTokens get radius =>
      const RadiusTokens(small: 2, medium: 3, large: 4, extraLarge: 6, full: 0);

  @override
  TypographyTokens get typography => const TypographyTokens(
    display: 48,
    headline: 30,
    title: 20,
    body: 14,
    caption: 12,
  );

  @override
  MotionTokens get motion => const MotionTokens(
    fast: Duration(milliseconds: 80),
    normal: Duration(milliseconds: 140),
    slow: Duration(milliseconds: 220),
  );

  @override
  ThemeData get theme => ThemeData(
    scaffoldBackgroundColor: colors.background,
    primaryColor: colors.accent,
    colorScheme: ColorScheme.light(
      primary: colors.accent,
      surface: colors.surface,
      outline: colors.border,
      onSurface: colors.textPrimary,
    ),
    textTheme: TextTheme(
      labelMedium: TextStyle(
        fontSize: typography.caption,
        fontWeight: FontWeight.w900,
        letterSpacing: 0.5,
        color: colors.textSecondary,
      ),
      bodyMedium: TextStyle(
        fontSize: typography.body,
        height: 1.4,
        color: colors.textSecondary,
      ),
      headlineMedium: TextStyle(
        fontSize: typography.title,
        fontWeight: FontWeight.w800,
        color: colors.textPrimary,
      ),
      displaySmall: TextStyle(
        fontSize: typography.headline,
        fontWeight: FontWeight.w900,
        height: 1.05,
        color: colors.textPrimary,
      ),
    ),
  );
}
