import 'package:flutter/material.dart';
import 'package:portfolio/core/extension/theme_extension.dart';

class IntroFlow extends StatelessWidget {
  const IntroFlow({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    final steps = ["Idea", "Systems", "Product", "Impact"];

    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: List.generate(steps.length * 2 - 1, (index) {
        if (index.isEven) {
          final step = steps[index ~/ 2];

          return Container(
            margin: const EdgeInsets.symmetric(vertical: 6),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(999),
              border: Border.all(color: colors.border),
              color: colors.surface.withValues(alpha: 0.6),
            ),
            child: Text(
              step.toUpperCase(),
              style: TextStyle(
                color: colors.textPrimary,
                fontSize: 11,
                letterSpacing: 1.4,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        }

        return Container(
          width: 24,
          height: 1,
          margin: const EdgeInsets.symmetric(horizontal: 6),
          color: colors.border.withValues(alpha: 0.6),
        );
      }),
    );
  }
}
