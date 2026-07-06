import 'package:flutter/material.dart';
import 'package:portfolio/core/extension/responsive_extension.dart';
import 'package:portfolio/core/extension/theme_extension.dart';
import 'package:portfolio/features/eng_capabilities/presentation/widgets/engineering_snapshot_card.dart';

class EngineeringSnapshot extends StatelessWidget {
  const EngineeringSnapshot({super.key});

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = context.isDesktop;
        final isTablet = context.isTablet;

        final double itemWidth;
        if (isDesktop) {
          itemWidth = (constraints.maxWidth - (spacing.lg * 3) / 4);
        } else if (isTablet) {
          itemWidth = (constraints.maxWidth - spacing.lg) / 2;
        } else {
          itemWidth = constraints.maxWidth;
        }

        return Wrap(
          spacing: spacing.lg,
          runSpacing: spacing.lg,
          children: [
            SizedBox(
              width: itemWidth,
              child: const EngineeringSnapshotCard(
                title: "Languages",
                value: "08",
              ),
            ),
            SizedBox(
              width: itemWidth,
              child: const EngineeringSnapshotCard(
                title: "Projects",
                value: "05",
              ),
            ),
            SizedBox(
              width: itemWidth,
              child: const EngineeringSnapshotCard(
                title: "Certificates",
                value: "14",
              ),
            ),
            SizedBox(
              width: itemWidth,
              child: const EngineeringSnapshotCard(
                title: "Platforms",
                value: "06",
              ),
            ),
          ],
        );
      },
    );
  }
}
