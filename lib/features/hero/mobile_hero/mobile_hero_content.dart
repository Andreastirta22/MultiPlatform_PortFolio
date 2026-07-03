import 'package:flutter/material.dart';
import 'package:portfolio/features/hero/hero_content.dart';
import 'package:portfolio/features/hero/hero_social_items.dart';
import 'package:portfolio/features/hero/hero_stat.dart';

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
