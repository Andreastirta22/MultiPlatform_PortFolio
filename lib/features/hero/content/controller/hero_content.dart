import 'package:flutter/material.dart';
import 'package:portfolio/features/hero/content/desktop_hero_content.dart';
import 'package:portfolio/features/hero/mobile_hero/mobile_hero_content.dart';

class HeroContent extends StatelessWidget {
  const HeroContent({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width < 600) {
      return const MobileHeroContent();
    } else {
      return const DesktopHeroLayout();
    }
  }
}
