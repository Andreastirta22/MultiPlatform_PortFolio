import 'package:flutter/material.dart';
import 'package:portfolio/core/extension/responsive_extension.dart';
import 'package:portfolio/features/hero/dektop_hero/large_hero.dart';
import 'package:portfolio/features/hero/mobile_hero/mobile_hero_cover.dart';

class HeroLayout extends StatelessWidget {
  const HeroLayout({super.key});

  @override
  Widget build(BuildContext context) {
    if (context.isPhone) {
      return const MobileHeroCover();
    }

    return const LargeHero();
  }
}
