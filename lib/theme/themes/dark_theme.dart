import 'package:flutter/material.dart';
import 'package:portfolio/theme/app_theme_config.dart';
import 'package:portfolio/theme/tokens/color_tokens.dart';
import 'package:portfolio/theme/tokens/motion_tokens.dart';
import 'package:portfolio/theme/tokens/radius_tokens.dart';
import 'package:portfolio/theme/tokens/spacing_tokens.dart';
import 'package:portfolio/theme/tokens/typography_tokens.dart';
import 'package:portfolio/theme/tokens/visual_tokens.dart';

class DarkTheme implements AppThemeConfig {
  @override
  ColorTokens get colors => const ColorTokens(
    background: Color(0xFF0B0C0F),
    surface: Color(0xFF14161A),
    accent: Color(0xFF00E5FF),
    border: Color(0xFF23262B),
    textPrimary: Color(0xFFF2F4F8),
    textSecondary: Color(0xFF8A8F98),
    transparent: Colors.transparent,
  );

  @override
  VisualTokens get visuals => const VisualTokens(
    glass: true,
    outlined: true,
    blur: 12,
    elevation: 2,
    navbarRadius: 999,
    cardRadius: 16,
  );

  @override
  SpacingTokens get spacing => const SpacingTokens(
    xs: 4,
    sm: 8,
    md: 14, // tweak kecil biar density lebih “tight”
    lg: 20,
    xl: 28,
    xxl: 40,
  );

  @override
  RadiusTokens get radius => const RadiusTokens(
    small: 6,
    medium: 10,
    large: 14,
    extraLarge: 16, // jauh lebih controlled
    full: 999,
  );

  @override
  TypographyTokens get typography => const TypographyTokens(
    display: 54,
    headline: 34,
    title: 22,
    body: 15, // lebih compact feel
    caption: 13,
  );

  @override
  MotionTokens get motion => const MotionTokens(
    fast: Duration(milliseconds: 120), // lebih snappy
    normal: Duration(milliseconds: 180),
    slow: Duration(milliseconds: 260),
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
      onSurface: colors.textPrimary,
    ),

    textTheme: TextTheme(
      labelMedium: TextStyle(
        fontSize: typography.caption,
        fontWeight: FontWeight.w600,
        letterSpacing: 2.5,
        color: colors.textSecondary,
      ),

      bodyMedium: TextStyle(
        fontSize: typography.body,
        color: colors.textSecondary,
        height: 1.5,
      ),

      headlineMedium: TextStyle(
        fontSize: typography.title,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.5,
        color: colors.textPrimary,
      ),

      displaySmall: TextStyle(
        fontSize: typography.headline,
        fontWeight: FontWeight.w500,
        height: 1.1,
        letterSpacing: -1,
        color: colors.textPrimary,
      ),
    ),
  );
}
