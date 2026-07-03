import 'package:flutter/material.dart';
import 'package:portfolio/features/hero/hero_content.dart';
import 'package:portfolio/features/hero/mobile_hero/mobile_hero_cover.dart';

class MobileHero extends StatelessWidget {
  const MobileHero({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        MobileHeroCover(),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: HeroContent(),
          ),
        ),
      ],
    );
  }
}
