import 'package:flutter/material.dart';
import 'package:portfolio/core/extension/theme_extension.dart';

class MinimalCardTemplate extends StatelessWidget {
  const MinimalCardTemplate({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final radius = context.radius;

    return AnimatedContainer(
      duration: context.motion.normal,
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(radius.extraLarge),
        border: Border.all(color: colors.border.withValues(alpha: .4)),
        boxShadow: [
          BoxShadow(
            blurRadius: 12,
            spreadRadius: -2,
            offset: const Offset(0, 6),
            color: Colors.black.withValues(alpha: .05),
          ),
        ],
      ),
      child: child,
    );
  }
}
