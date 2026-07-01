import 'package:flutter/material.dart';
import 'package:portfolio/core/extension/theme_extension.dart';

class NeoCardTemplate extends StatelessWidget {
  const NeoCardTemplate({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final radius = context.radius;

    return AnimatedContainer(
      duration: context.motion.normal,
      decoration: BoxDecoration(
        color: colors.surface,

        borderRadius: BorderRadius.circular(radius.large),

        border: Border.all(width: 1.5, color: colors.accent),

        boxShadow: [
          BoxShadow(
            blurRadius: 25,
            spreadRadius: -5,
            color: colors.accent.withValues(alpha: .25),
          ),
        ],
      ),

      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,

            child: Container(
              width: 42,
              height: 42,

              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(color: colors.accent),
                  bottom: BorderSide(color: colors.accent),
                ),
              ),
            ),
          ),

          child,
        ],
      ),
    );
  }
}
