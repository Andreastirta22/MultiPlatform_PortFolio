import 'package:flutter/material.dart';
import 'package:portfolio/core/extension/responsive_extension.dart';
import 'package:portfolio/core/extension/theme_extension.dart';
import 'package:portfolio/features/eng_capabilities/presentation/widgets/engineering_snapshot_card.dart';

class EngineeringSnapshot extends StatelessWidget {
  const EngineeringSnapshot({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final spacing = context.spacing;

    final isDesktop = context.isDesktop;
    final isTablet = context.isTablet;

    return Container(
      padding: EdgeInsets.all(spacing.xl),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: colors.border),
      ),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: isDesktop
            ? 4
            : isTablet
            ? 2
            : 1,
        crossAxisSpacing: spacing.lg,
        mainAxisSpacing: spacing.lg,
        childAspectRatio: isDesktop ? 1.8 : 1.6,
        children: const [
          EngineeringSnapshotCard(title: "Languages", value: "08"),
          EngineeringSnapshotCard(title: "Projects", value: "05"),
          EngineeringSnapshotCard(title: "Certificates", value: "14"),
          EngineeringSnapshotCard(title: "Platforms", value: "06"),
        ],
      ),
    );
  }
}
