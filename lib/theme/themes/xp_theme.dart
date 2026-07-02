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
    background: Color(0xFF3A6EA5),
    surface: Color(0xFFD6E3F3),
    accent: Color(0xFFFFC300),
    border: Color(0xFF28588C),
    textPrimary: Color(0xFF111111),
    textSecondary: Color(0xFF555555),
    transparent: Colors.transparent,
  );

  @override
  VisualTokens get visuals => const VisualTokens(
    glass: false,
    outlined: true,
    blur: 0,
    elevation: 3,
    navbarRadius: 4,
    cardRadius: 4,
  );

  @override
  SpacingTokens get spacing =>
      const SpacingTokens(xs: 4, sm: 8, md: 16, lg: 24, xl: 32, xxl: 48);

  @override
  RadiusTokens get radius => const RadiusTokens(
    small: 2,
    medium: 4,
    large: 6,
    extraLarge: 8,
    full: 999,
  );

  @override
  TypographyTokens get typography => const TypographyTokens(
    display: 52,
    headline: 34,
    title: 22,
    body: 14,
    caption: 12,
  );

  @override
  MotionTokens get motion => const MotionTokens(
    fast: Duration(milliseconds: 100),
    normal: Duration(milliseconds: 200),
    slow: Duration(milliseconds: 350),
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
        fontWeight: FontWeight.w800,
        letterSpacing: 1,
        color: colors.textSecondary,
      ),

      bodyMedium: TextStyle(
        fontSize: typography.body,
        color: colors.textSecondary,
      ),

      headlineMedium: TextStyle(
        fontSize: typography.title,
        fontWeight: FontWeight.w700,
        color: colors.textPrimary,
      ),
      displaySmall: TextStyle(
        fontSize: typography.headline,
        fontWeight: FontWeight.w800,
        height: 1.05,
        color: colors.textPrimary,
      ),
    ),
  );
}
