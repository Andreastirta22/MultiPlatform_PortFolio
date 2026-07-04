import 'package:flutter/material.dart';
import 'package:portfolio/theme/tokens/visual_tokens.dart';

import '../app_theme_config.dart';
import '../tokens/color_tokens.dart';
import '../tokens/motion_tokens.dart';
import '../tokens/radius_tokens.dart';
import '../tokens/spacing_tokens.dart';
import '../tokens/typography_tokens.dart';

class NeoTheme implements AppThemeConfig {
  @override
  ColorTokens get colors => const ColorTokens(
    background: Color(0xFFF2F5FA),
    surface: Color(0xFFFFFFFF),
    accent: Color(0xFF6C63FF),
    border: Color(0xFFD9DEE7),
    textPrimary: Color(0xFF1F1F1F),
    textSecondary: Color(0xFF6B7280),
    transparent: Colors.transparent,
  );

  @override
  VisualTokens get visuals => const VisualTokens(
    glass: true,
    outlined: false,
    blur: 22,
    elevation: 18,
    navbarRadius: 32,
    cardRadius: 28,
  );

  @override
  SpacingTokens get spacing =>
      const SpacingTokens(xs: 4, sm: 8, md: 16, lg: 24, xl: 32, xxl: 56);

  @override
  RadiusTokens get radius => const RadiusTokens(
    small: 10,
    medium: 16,
    large: 24,
    extraLarge: 36,
    full: 999,
  );

  @override
  TypographyTokens get typography => const TypographyTokens(
    display: 58,
    headline: 38,
    title: 24,
    body: 16,
    caption: 13,
  );

  @override
  MotionTokens get motion => const MotionTokens(
    fast: Duration(milliseconds: 120),
    normal: Duration(milliseconds: 200),
    slow: Duration(milliseconds: 320),
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
        fontWeight: FontWeight.w700,
        letterSpacing: 2.5,
        color: colors.textSecondary,
      ),
      bodyMedium: TextStyle(
        fontSize: typography.body,
        height: 1.6,
        color: colors.textSecondary,
      ),
      headlineMedium: TextStyle(
        fontSize: typography.title,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.5,
        color: colors.textPrimary,
      ),
      displaySmall: TextStyle(
        fontSize: typography.headline,
        fontWeight: FontWeight.w700,
        height: 1.05,
        letterSpacing: -1,
        color: colors.textPrimary,
      ),
    ),
  );
}
