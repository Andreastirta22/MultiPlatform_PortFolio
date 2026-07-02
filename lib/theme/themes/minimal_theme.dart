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
    surface: Color(0xFFF8F8F8),
    accent: Color(0xFF000000),
    border: Color(0xFFE8E8E8),
    textPrimary: Color(0xFF111111),
    textSecondary: Color(0xFF8B8B8B),
    transparent: Colors.transparent,
  );

  @override
  VisualTokens get visuals => const VisualTokens(
    glass: false,
    outlined: false,
    blur: 0,
    elevation: 0,
    navbarRadius: 16,
    cardRadius: 16,
  );

  @override
  SpacingTokens get spacing =>
      const SpacingTokens(xs: 4, sm: 8, md: 16, lg: 24, xl: 32, xxl: 48);

  @override
  RadiusTokens get radius => const RadiusTokens(
    small: 12,
    medium: 16,
    large: 24,
    extraLarge: 32,
    full: 999,
  );

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
    slow: Duration(milliseconds: 450),
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
        fontWeight: FontWeight.w500,
        letterSpacing: 2,
        color: colors.textSecondary,
      ),
      bodyMedium: TextStyle(
        fontSize: typography.body,
        fontWeight: FontWeight.w400,
        color: colors.textSecondary,
        height: 1.6,
      ),
      headlineMedium: TextStyle(
        fontSize: typography.title,
        fontWeight: FontWeight.w500,
        color: colors.textPrimary,
      ),
      displaySmall: TextStyle(
        fontSize: typography.headline,
        fontWeight: FontWeight.w500,
        height: 1.15,
        color: colors.textPrimary,
      ),
    ),
  );
}
