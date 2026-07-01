import 'package:flutter/material.dart';
import 'package:portfolio/core/extension/theme_extension.dart';

class EditorialCardTemplate extends StatelessWidget {
  final Widget child;
  const EditorialCardTemplate({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final spacing = context.spacing;
    final radius = context.radius;
    return AnimatedContainer(
      duration: context.motion.normal,
      padding: EdgeInsets.all(spacing.xl),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(radius.large),
        border: Border(
          top: BorderSide(width: 2, color: colors.textPrimary),
          bottom: BorderSide(width: 1, color: colors.border),
        ),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(height: 1, thickness: .5, color: colors.border),
          SizedBox(height: spacing.lg),
          child,
          SizedBox(height: spacing.lg),
          Divider(height: 1, thickness: .5, color: colors.border),
        ],
      ),
    );
  }
}
