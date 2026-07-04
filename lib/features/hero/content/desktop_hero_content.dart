import 'package:flutter/material.dart';
import 'package:portfolio/features/hero/content/hero_actions.dart';
import 'package:portfolio/features/hero/content/hero_description.dart';
import 'package:portfolio/features/hero/content/hero_headline.dart';
import 'package:portfolio/features/hero/content/hero_social_items.dart';
import 'package:portfolio/features/hero/content/hero_socials.dart';
import 'package:portfolio/features/hero/content/hero_stat.dart';
import 'package:portfolio/features/hero/content/hero_stats.dart';

class DesktopHeroLayout extends StatelessWidget {
  const DesktopHeroLayout({super.key});

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 60),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // LEFT = CONTENT
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeroHeadline(
                  title: "ANDREAS\nTIRTA SANJAYA",
                  subtitle: "Flutter Engineer",
                ),

                const SizedBox(height: 24),

                HeroDescription(
                  text:
                      "Flutter Engineer • Cross Platform Developer • Design System Enthusiast",
                ),

                const SizedBox(height: 32),
                const HeroActions(),

                const SizedBox(height: 40),
                HeroSocials(socials: socials),
              ],
            ),
          ),

          const SizedBox(width: 80),

          // RIGHT = VISUAL / IDENTITY PANEL
          Expanded(
            flex: 4,
            child: Column(
              children: [
                HeroStats(stats: stats),

                const SizedBox(height: 24),

                Container(
                  height: 280,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white.withValues(alpha: 0.05),
                        Colors.white.withValues(alpha: 0.02),
                      ],
                    ),
                    border: Border.all(color: Colors.white12),
                  ),
                  child: const Center(
                    child: Text("Visual / Avatar / Animation"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
