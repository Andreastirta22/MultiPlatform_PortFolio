import 'package:flutter/material.dart';
import 'package:portfolio/theme/app_theme.dart';
import 'package:portfolio/theme/app_theme_config.dart';
import 'package:portfolio/theme/theme_mode.dart';
import 'package:portfolio/theme/tokens/color_tokens.dart';
import 'package:portfolio/theme/tokens/motion_tokens.dart';
import 'package:portfolio/theme/tokens/radius_tokens.dart';
import 'package:portfolio/theme/tokens/spacing_tokens.dart';
import 'package:portfolio/theme/tokens/typography_tokens.dart';

extension ThemeExtension on BuildContext {
  AppThemeConfig get appTheme {
    return AppTheme.resolve(PortfolioTheme.dark);
  }

  ColorTokens get colors {
    return appTheme.colors;
  }

  SpacingTokens get spacing {
    return appTheme.spacing;
  }

  RadiusTokens get radius {
    return appTheme.radius;
  }

  TypographyTokens get typography {
    return appTheme.typography;
  }

  MotionTokens get motion {
    return appTheme.motion;
  }
}
