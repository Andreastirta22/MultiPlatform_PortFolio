import 'package:flutter/material.dart';
import 'package:portfolio/features/projects/widgets/project_grid.dart';
import 'package:portfolio/theme/controller/theme_controller.dart';
import 'package:provider/provider.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    final isMobile = width < 768;
    final isTablet = width < 1200;

    final horizontalPadding = isMobile
        ? 24.0
        : isTablet
        ? 48.0
        : 96.0;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: isMobile ? 80 : 140,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// LABEL
          Text("SELECTED WORK", style: Theme.of(context).textTheme.labelMedium),
          const SizedBox(height: 20),

          /// TITLE
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: Text(
              "Projects that blend engineering, storytelling, and timeless design.",
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),

          const SizedBox(height: 32),

          /// DIVIDER
          Container(
            width: 80,
            height: 1,
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: .15),
          ),

          SizedBox(height: isMobile ? 48 : 72),

          AnimatedBuilder(
            animation: context.watch<ThemeController>(),
            builder: (context, _) {
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                switchInCurve: Curves.easeOutCubic,
                switchOutCurve: Curves.easeInCubic,
                child: ProjectGrids(
                  key: ValueKey(context.watch<ThemeController>().currentTheme),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
