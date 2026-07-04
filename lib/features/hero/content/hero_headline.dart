import 'package:flutter/material.dart';
import 'package:portfolio/core/extension/theme_extension.dart';
import 'package:portfolio/theme/responsive_typography_extension.dart';

class HeroHeadline extends StatelessWidget {
  final String title;
  final String subtitle;

  const HeroHeadline({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: context.haroDisplay * 1.1,
            fontWeight: FontWeight.w800,
            letterSpacing: -1.2,
            height: 1.05,
          ),
        ),
        SizedBox(height: context.spacing.sm),
        Text(subtitle, style: TextStyle(fontSize: context.heroHeadline)),
      ],
    );
  }
}
