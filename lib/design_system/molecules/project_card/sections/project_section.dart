import 'package:flutter/material.dart';
import 'package:portfolio/features/projects/widgets/project_grid.dart';
import 'package:portfolio/theme/theme_scope.dart';

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
          Text(
            "SELECTED WORK",
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              letterSpacing: 3,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 20),

          /// TITLE
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: Text(
              "Projects that blend engineering, storytelling, and timeless design.",
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                height: 1.12,
                fontWeight: FontWeight.w500,
              ),
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
            animation: ThemeScope.controller,
            builder: (context, child) {
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),

                switchInCurve: Curves.easeOutCubic,
                switchOutCurve: Curves.easeInCubic,

                child: ProjectGrids(
                  key: ValueKey(ThemeScope.controller.currentTheme),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
