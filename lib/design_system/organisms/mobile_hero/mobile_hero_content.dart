import 'package:flutter/material.dart';
import 'package:portfolio/design_system/organisms/hero/hero_social_items.dart';
import 'package:portfolio/design_system/organisms/hero/hero_stat.dart';
import 'package:portfolio/design_system/organisms/hero_content.dart';

class MobileHeroContent extends StatelessWidget {
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
  const MobileHeroContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(padding: EdgeInsets.all(24), child: HeroContent()),
    );
  }
}
