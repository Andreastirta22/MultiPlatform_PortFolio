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
    background: Color(0xFFE8EDF5),
    surface: Color(0xFFE8EDF5),
    accent: Color(0xFF6C63FF),
    border: Color(0xFFD7DCE4),
    textPrimary: Color(0xFF2B2B2B),
    textSecondary: Color(0xFF6A6A6A),
    transparent: Colors.transparent,
  );

  @override
  VisualTokens get visuals => const VisualTokens(
    glass: true,

    outlined: false,

    blur: 30,

    elevation: 12,

    navbarRadius: 28,

    cardRadius: 24,
  );

  @override
  SpacingTokens get spacing =>
      const SpacingTokens(xs: 4, sm: 8, md: 16, lg: 24, xl: 32, xxl: 48);

  @override
  RadiusTokens get radius => const RadiusTokens(
    small: 15,
    medium: 20,
    large: 28,
    extraLarge: 40,
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

    slow: Duration(milliseconds: 500),
  );

  @override
  ThemeData get theme => ThemeData(
    scaffoldBackgroundColor: colors.background,

    primaryColor: colors.accent,

    colorScheme: ColorScheme.light(
      primary: colors.accent,

      surface: colors.surface,

      outline: colors.border,
    ),
  );
}
