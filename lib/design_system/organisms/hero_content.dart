import 'package:flutter/material.dart';
import 'package:portfolio/design_system/organisms/hero/hero_actions.dart';
import 'package:portfolio/design_system/organisms/hero/hero_description.dart';
import 'package:portfolio/design_system/organisms/hero/hero_headline.dart';
import 'package:portfolio/design_system/organisms/hero/hero_layout.dart';
import 'package:portfolio/design_system/organisms/hero/hero_social_items.dart';
import 'package:portfolio/design_system/organisms/hero/hero_socials.dart';
import 'package:portfolio/design_system/organisms/hero/hero_stat.dart';
import 'package:portfolio/design_system/organisms/hero/hero_stats.dart';

class HeroContent extends StatelessWidget {
  const HeroContent({super.key});

  static const socials = [
    SocialItem(label: 'Github', icon: Icons.code, url: ''),

    SocialItem(label: 'LinkedIn', icon: Icons.work, url: ''),

    SocialItem(label: 'Email', icon: Icons.mail, url: ''),
  ];

  static const stats = [
    HeroStat(value: '7+', label: 'Projects'),

    HeroStat(value: '5', label: 'Themes'),

    HeroStat(value: '3+', label: 'Years'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeroHeadline(
          title: "ANDREAS\nTIRTA SANJAYA",

          subtitle: "Flutter Engineer",
        ),
        SizedBox(height: 24),
        HeroDescription(
          text:
              "Flutter Engineer • "
              "Cross Platform Developer • "
              "Design System Enthusiast",
        ),
        SizedBox(height: 32),
        HeroActions(),
        SizedBox(height: 32),
        HeroSocials(socials: HeroLayout.socials),
        SizedBox(height: 32),
        HeroStats(stats: HeroLayout.stats),
      ],
    );
  }
}
