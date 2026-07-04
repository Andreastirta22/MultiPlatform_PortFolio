import 'package:flutter/material.dart';
import 'package:portfolio/features/hero/content/hero_social_items.dart';

class HeroSocials extends StatelessWidget {
  final List<SocialItem> socials;
  const HeroSocials({super.key, required this.socials});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      children: socials.map((s) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: Colors.white12),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                s.icon,
                size: 16,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              const SizedBox(width: 6),
              Text(s.label),
            ],
          ),
        );
      }).toList(),
    );
  }
}
