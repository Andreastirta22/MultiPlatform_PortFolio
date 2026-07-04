import 'package:flutter/material.dart';
import 'package:portfolio/core/extension/theme_extension.dart';

class IntroHeader extends StatelessWidget {
  const IntroHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 720),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "HOW I WORK",
            style: TextStyle(
              color: colors.textSecondary.withValues(alpha: 0.65),
              fontSize: 10,
              letterSpacing: 2.8,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "How I Build Products",
            style: TextStyle(
              color: colors.textPrimary,
              fontSize: 38,
              fontWeight: FontWeight.w700,
              height: 1.1,
              letterSpacing: -0.8,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            "Systems first. Interfaces later. Every product starts from structure, not screens. "
            "I focus on scalable architecture and intentional design that survives complexity.",
            style: TextStyle(
              color: colors.textPrimary.withValues(alpha: 0.85),
              fontSize: 13,
              height: 1.55,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
