import 'package:flutter/material.dart';
import 'package:portfolio/core/extension/theme_extension.dart';

class DarkCardTemplate extends StatelessWidget {
  final Widget child;
  const DarkCardTemplate({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final radius = context.radius;
    return AnimatedContainer(
      duration: context.motion.normal,
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(radius.extraLarge),
        border: Border.all(color: colors.border),
        boxShadow: [
          BoxShadow(
            blurRadius: 30,
            spreadRadius: -10,
            color: colors.accent.withValues(alpha: .15),
          ),
        ],
      ),
      child: child,
    );
  }
}
