import 'package:flutter/material.dart';
import 'package:portfolio/design_system/organisms/hero/hero_social_items.dart';

class HeroSocials extends StatelessWidget {
  final List<SocialItem> socials;
  const HeroSocials({super.key, required this.socials});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: socials.map((social) {
        return Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Text(social.label),
        );
      }).toList(),
    );
  }
}
