import 'package:flutter/material.dart';
import 'package:portfolio/core/extension/theme_extension.dart';
import 'package:portfolio/theme/theme_mode.dart';

import 'card_templates/dark_card_template.dart';
import 'card_templates/editorial_card_template.dart';
import 'card_templates/minimal_card_template.dart';
import 'card_templates/neo_card_template.dart';
import 'card_templates/xp_card_template.dart';

class ThemeCard extends StatelessWidget {
  const ThemeCard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    switch (context.themeMode) {
      case PortfolioTheme.dark:
        return DarkCardTemplate(child: child);

      case PortfolioTheme.editorial:
        return EditorialCardTemplate(child: child);

      case PortfolioTheme.minimal:
        return MinimalCardTemplate(child: child);

      case PortfolioTheme.neo:
        return NeoCardTemplate(child: child);

      case PortfolioTheme.xp:
        return XpCardTemplate(child: child);
    }
  }
}
