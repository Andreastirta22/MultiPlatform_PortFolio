import 'package:flutter/material.dart';
import 'package:portfolio/theme/tokens/visual_tokens.dart';

import '../app_theme_config.dart';
import '../tokens/color_tokens.dart';
import '../tokens/motion_tokens.dart';
import '../tokens/radius_tokens.dart';
import '../tokens/spacing_tokens.dart';
import '../tokens/typography_tokens.dart';

class MinimalTheme implements AppThemeConfig {
  @override
  ColorTokens get colors => const ColorTokens(
    background: Color(0xFFFFFFFF),
    surface: Color(0xFFF6F6F6),
    accent: Color(0xFF000000),
    border: Color(0xFFEDEDED),
    textPrimary: Color(0xFF0F0F0F),
    textSecondary: Color(0xFF7A7A7A),
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
      const SpacingTokens(xs: 4, sm: 8, md: 16, lg: 24, xl: 40, xxl: 64);

  @override
  RadiusTokens get radius =>
      const RadiusTokens(small: 0, medium: 0, large: 0, extraLarge: 0, full: 0);

  @override
  TypographyTokens get typography => const TypographyTokens(
    display: 54,
    headline: 34,
    title: 22,
    body: 15,
    caption: 12,
  );

  @override
  MotionTokens get motion => const MotionTokens(
    fast: Duration(milliseconds: 100),
    normal: Duration(milliseconds: 180),
    slow: Duration(milliseconds: 260),
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
        fontWeight: FontWeight.w600,
        letterSpacing: 3,
        color: colors.textSecondary,
      ),
      bodyMedium: TextStyle(
        fontSize: typography.body,
        fontWeight: FontWeight.w400,
        height: 1.7,
        color: colors.textSecondary,
      ),
      headlineMedium: TextStyle(
        fontSize: typography.title,
        fontWeight: FontWeight.w600,
        height: 1.2,
        color: colors.textPrimary,
      ),
      displaySmall: TextStyle(
        fontSize: typography.headline,
        fontWeight: FontWeight.w400,
        height: 1.15,
        letterSpacing: -0.5,
        color: colors.textPrimary,
      ),
    ),
  );
}
