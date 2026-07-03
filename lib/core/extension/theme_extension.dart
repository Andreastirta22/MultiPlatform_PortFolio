import 'package:flutter/material.dart';
import 'package:portfolio/theme/app_theme.dart';
import 'package:portfolio/theme/app_theme_config.dart';
import 'package:portfolio/theme/controller/theme_controller.dart';
import 'package:portfolio/theme/theme_mode.dart';
import 'package:portfolio/theme/tokens/color_tokens.dart';
import 'package:portfolio/theme/tokens/motion_tokens.dart';
import 'package:portfolio/theme/tokens/radius_tokens.dart';
import 'package:portfolio/theme/tokens/spacing_tokens.dart';
import 'package:portfolio/theme/tokens/typography_tokens.dart';
import 'package:portfolio/theme/tokens/visual_tokens.dart';
import 'package:provider/provider.dart';

extension ThemeExtension on BuildContext {
  PortfolioTheme get themeMode => watch<ThemeController>().currentTheme;

  AppThemeConfig get appTheme => AppTheme.resolve(themeMode);

  ColorTokens get colors => appTheme.colors;

  SpacingTokens get spacing => appTheme.spacing;

  RadiusTokens get radius => appTheme.radius;

  TypographyTokens get typography => appTheme.typography;

  MotionTokens get motion => appTheme.motion;

  VisualTokens get visuals => appTheme.visuals;
}
