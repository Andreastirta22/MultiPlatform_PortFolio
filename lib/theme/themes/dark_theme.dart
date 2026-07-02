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
    background: Color(0xFF0E0E10),
    surface: Color(0xFF1A1A1E),
    accent: Color(0xFFFF7A18),
    border: Color(0xFF2C2C30),
    textPrimary: Color(0xFFF5F5F7),
    textSecondary: Color(0xFF9A9AA1),
    transparent: Colors.transparent,
  );

  @override
  VisualTokens get visuals => const VisualTokens(
    glass: true,
    outlined: false,
    blur: 20,
    elevation: 8,
    navbarRadius: 999,
    cardRadius: 28,
  );

  @override
  SpacingTokens get spacing =>
      const SpacingTokens(xs: 4, sm: 8, md: 16, lg: 24, xl: 32, xxl: 48);

  @override
  RadiusTokens get radius => const RadiusTokens(
    small: 8,
    medium: 12,
    large: 20,
    extraLarge: 28,
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
      /// SELECTED WORK
      labelMedium: TextStyle(
        fontSize: typography.caption,
        fontWeight: FontWeight.w600,
        letterSpacing: 3,
        color: colors.textSecondary,
      ),
      bodyMedium: TextStyle(
        fontSize: typography.body,
        color: colors.textSecondary,
        height: 1.6,
      ),
      headlineMedium: TextStyle(
        fontSize: typography.title,
        fontWeight: FontWeight.w600,
        color: colors.textPrimary,
      ),

      /// Projects that blend...
      displaySmall: TextStyle(
        fontSize: typography.headline,
        fontWeight: FontWeight.w500,
        height: 1.12,
        color: colors.textPrimary,
      ),
    ),
  );
}
