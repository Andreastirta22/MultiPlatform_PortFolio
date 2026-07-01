import 'package:flutter/material.dart';
import 'package:portfolio/theme/theme_mode.dart';

class AppThemeInfo {
  final String name;
  final String subtitle;
  final IconData icon;
  final int order;

  const AppThemeInfo({
    required this.name,
    required this.subtitle,
    required this.icon,
    required this.order,
  });
}

const totalThemes = 5;

const themeInfos = {
  PortfolioTheme.dark: AppThemeInfo(
    name: "MIDNIGHT",
    subtitle: "Dark immersive experience",
    icon: Icons.dark_mode,
    order: 1,
  ),
  PortfolioTheme.editorial: AppThemeInfo(
    name: "EDITORIAL",
    subtitle: "Heritage × Storytelling",
    icon: Icons.menu_book,
    order: 2,
  ),
  PortfolioTheme.minimal: AppThemeInfo(
    name: "MINIMAL",
    subtitle: "Clean modern interface",
    icon: Icons.grid_view,
    order: 3,
  ),
  PortfolioTheme.neo: AppThemeInfo(
    name: "NEO",
    subtitle: "Future design language",
    icon: Icons.auto_awesome,
    order: 4,
  ),
  PortfolioTheme.xp: AppThemeInfo(
    name: "XP",
    subtitle: "Retro desktop nostalgia",
    icon: Icons.window,
    order: 5,
  ),
};
