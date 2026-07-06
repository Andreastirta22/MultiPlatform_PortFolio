import 'package:flutter/material.dart';
import 'package:portfolio/core/extension/theme_extension.dart';

class EngineeringHeader extends StatelessWidget {
  const EngineeringHeader({
    super.key,
    required this.sectionLabel,
    required this.title,
    required this.subtitle,
    required this.statuses,
  });

  final String sectionLabel;
  final String title;
  final String subtitle;
  final List<String> statuses;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.typography;
    final spacing = context.spacing;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 900;

        return isDesktop
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 6,
                    child: _buildLeft(colors, typography, spacing),
                  ),
                  SizedBox(width: spacing.xl),
                  Expanded(
                    flex: 4,
                    child: _buildRight(colors, typography, spacing),
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildLeft(colors, typography, spacing),
                  SizedBox(height: spacing.lg),
                  _buildRight(colors, typography, spacing),
                ],
              );
      },
    );
  }

  Widget _buildLeft(dynamic colors, dynamic typography, dynamic spacing) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          sectionLabel,
          style: TextStyle(
            color: colors.accent,
            fontSize: typography.caption,
            fontWeight: FontWeight.w600,
            letterSpacing: 2,
          ),
        ),

        SizedBox(height: spacing.sm),

        Text(
          title,
          style: TextStyle(
            color: colors.textPrimary,
            fontSize: typography.display,
            fontWeight: FontWeight.bold,
            height: 1.1,
          ),
        ),

        SizedBox(height: spacing.md),

        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 580),
          child: Text(
            subtitle,
            style: TextStyle(
              color: colors.textSecondary,
              fontSize: typography.body,
              height: 1.6,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRight(dynamic colors, dynamic typography, dynamic spacing) {
    return Wrap(
      spacing: spacing.sm,
      runSpacing: spacing.sm,
      children: statuses
          .map(
            (status) => Container(
              padding: EdgeInsets.symmetric(
                horizontal: spacing.md,
                vertical: spacing.sm,
              ),
              decoration: BoxDecoration(
                color: colors.surface,
                border: Border.all(color: colors.border),
                borderRadius: BorderRadius.circular(999),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: colors.accent,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: spacing.sm),
                  Text(
                    status,
                    style: TextStyle(
                      color: colors.textPrimary,
                      fontSize: typography.caption,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
