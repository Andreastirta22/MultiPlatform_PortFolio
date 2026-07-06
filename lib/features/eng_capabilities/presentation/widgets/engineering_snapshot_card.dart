import 'package:flutter/material.dart';
import 'package:portfolio/core/extension/theme_extension.dart';

class EngineeringSnapshotCard extends StatelessWidget {
  const EngineeringSnapshotCard({
    super.key,
    required this.title,
    required this.value,
  });
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.typography;
    final spacing = context.spacing;

    return Container(
      padding: EdgeInsets.all(spacing.lg),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toLowerCase(),
            style: TextStyle(
              fontSize: typography.caption,
              color: colors.textSecondary,
              letterSpacing: 1.5,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: spacing.md),
          Text(
            value,
            style: TextStyle(
              fontSize: typography.display,
              color: colors.textPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
