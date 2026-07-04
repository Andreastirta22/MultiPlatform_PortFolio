import 'package:flutter/material.dart';
import 'package:portfolio/features/hero/content/hero_actions.dart';
import 'package:portfolio/features/hero/content/hero_description.dart';
import 'package:portfolio/features/hero/content/hero_headline.dart';
import 'package:portfolio/features/hero/content/hero_social_items.dart';
import 'package:portfolio/features/hero/content/hero_socials.dart';
import 'package:portfolio/features/hero/content/hero_stat.dart';
import 'package:portfolio/features/hero/content/hero_stats.dart';

class MobileHeroContent extends StatelessWidget {
  const MobileHeroContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeroHeadline(
              title: "ANDREAS\nTIRTA SANJAYA",
              subtitle: "Flutter Engineer",
            ),

            const SizedBox(height: 16),

            HeroDescription(
              text:
                  "Flutter Engineer • Cross Platform Developer • Design System Enthusiast",
            ),

            const SizedBox(height: 20),

            const HeroActions(),

            const SizedBox(height: 24),

            HeroSocials(
              socials: [
                SocialItem(label: 'Github', icon: Icons.code, url: ''),
                SocialItem(label: 'LinkedIn', icon: Icons.work, url: ''),
                SocialItem(label: 'Email', icon: Icons.mail, url: ''),
              ],
            ),

            const SizedBox(height: 24),

            HeroStats(
              stats: [
                HeroStat(value: '7+', label: 'Projects'),
                HeroStat(value: '5', label: 'Themes'),
                HeroStat(value: '3+', label: 'Years'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
