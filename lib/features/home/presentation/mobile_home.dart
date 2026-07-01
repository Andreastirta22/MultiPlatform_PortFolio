import 'package:flutter/material.dart';
import 'package:portfolio/design_system/molecules/project_card/sections/project_section.dart';
import 'package:portfolio/design_system/organisms/mobile_hero/mobile_hero_content.dart';
import 'package:portfolio/design_system/organisms/mobile_hero/mobile_hero_cover.dart';

class MobileHome extends StatelessWidget {
  final ScrollController controller;
  const MobileHome({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: controller,
      slivers: [
        const MobileHeroCover(),
        const MobileHeroContent(),
        const SliverToBoxAdapter(child: ProjectSection()),
      ],
    );
  }
}
