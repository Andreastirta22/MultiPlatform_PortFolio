import 'package:flutter/material.dart';
import 'package:portfolio/core/extension/theme_extension.dart';
import 'package:portfolio/features/projects/models/project_model.dart';
import 'package:portfolio/theme/components/project_cards/dark_project_card.dart';
import 'package:portfolio/theme/components/project_cards/editorial_project_card.dart';
import 'package:portfolio/theme/components/project_cards/minimal_project_card.dart';
import 'package:portfolio/theme/components/project_cards/neo_project_card.dart';
import 'package:portfolio/theme/components/project_cards/xp_project_card.dart';
import 'package:portfolio/theme/theme_mode.dart';

class ProjectCardFactory {
  static Widget build({
    required BuildContext context,
    required ProjectModel project,
  }) {
    switch (context.themeMode) {
      case PortfolioTheme.dark:
        return DarkProjectCard(project: project);

      case PortfolioTheme.editorial:
        return EditorialProjectCard(project: project);

      case PortfolioTheme.minimal:
        return MinimalProjectCard(project: project);

      case PortfolioTheme.neo:
        return NeoProjectCard(project: project);

      case PortfolioTheme.xp:
        return XPProjectCard(project: project);
    }
  }
}
