import 'package:flutter/material.dart';
import 'package:portfolio/core/extension/responsive_extension.dart';

import 'hero_actions.dart';
import 'hero_avatar.dart';
import 'hero_description.dart';
import 'hero_headline.dart';
import 'hero_social_items.dart';
import 'hero_socials.dart';
import 'hero_stat.dart';
import 'hero_stats.dart';

class HeroLayout extends StatelessWidget {
  const HeroLayout({super.key});

  static const socials = [
    SocialItem(label: 'Github', icon: Icons.code, url: 'https://github.com'),
    SocialItem(
      label: 'LinkedIn',
      icon: Icons.work,
      url: 'https://linkedin.com',
    ),
    SocialItem(
      label: 'Email',
      icon: Icons.mail,
      url: 'mailto:hello@andreastirta.dev',
    ),
  ];

  static const stats = [
    HeroStat(value: '7+', label: 'Projects'),
    HeroStat(value: '5', label: 'Themes'),
    HeroStat(value: '3+', label: 'Years'),
  ];

  @override
  Widget build(BuildContext context) {
    if (context.isDesktop) {
      return _desktop(context);
    }

    if (context.isTablet) {
      return _tablet(context);
    }

    return _mobile(context);
  }

  Widget _content(
    BuildContext context, {
    double? width,
    bool centered = false,
  }) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: centered
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          HeroHeadline(
            title: 'ANDREAS\nTIRTA SANJAYA',
            subtitle: 'FLUTTER ENGINEER',
          ),

          const SizedBox(height: 32),

          HeroDescription(
            text:
                'Flutter Engineer • '
                'Cross Platform Developer • '
                'Design System Enthusiast • '
                'Product Thinker',
          ),

          const SizedBox(height: 48),

          HeroActions(),

          const SizedBox(height: 40),

          HeroSocials(socials: socials),

          const SizedBox(height: 48),

          HeroStats(stats: stats),
        ],
      ),
    );
  }

  Widget _desktop(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1280),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 64),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 6, child: _content(context)),

              const SizedBox(width: 80),

              Expanded(
                flex: 5,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: HeroAvatar(
                    image: 'assets/images/andre.webp',
                    size: 460,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tablet(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 900),
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            children: [
              HeroAvatar(image: 'assets/images/andre.webp', size: 300),

              const SizedBox(height: 48),

              _content(context, centered: true),
            ],
          ),
        ),
      ),
    );
  }

  Widget _mobile(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HeroAvatar(image: 'assets/images/andre.webp', size: 220),

          const SizedBox(height: 40),

          _content(context, centered: true),
        ],
      ),
    );
  }
}
