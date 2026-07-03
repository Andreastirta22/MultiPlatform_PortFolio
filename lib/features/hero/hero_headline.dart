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
          maxLines: 2,
          softWrap: true,
          style: TextStyle(
            fontSize: context.haroDisplay,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: context.spacing.sm),
        Text(subtitle, style: TextStyle(fontSize: context.heroHeadline)),
      ],
    );
  }
}
