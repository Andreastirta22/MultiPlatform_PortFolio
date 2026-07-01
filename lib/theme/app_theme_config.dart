import 'package:flutter/material.dart';
import 'package:portfolio/theme/tokens/color_tokens.dart';
import 'package:portfolio/theme/tokens/motion_tokens.dart';
import 'package:portfolio/theme/tokens/radius_tokens.dart';
import 'package:portfolio/theme/tokens/spacing_tokens.dart';
import 'package:portfolio/theme/tokens/typography_tokens.dart';
import 'package:portfolio/theme/tokens/visual_tokens.dart';

abstract class AppThemeConfig {
  ThemeData get theme;

  ColorTokens get colors;

  TypographyTokens get typography;

  SpacingTokens get spacing;

  RadiusTokens get radius;

  MotionTokens get motion;

  VisualTokens get visuals;
}
