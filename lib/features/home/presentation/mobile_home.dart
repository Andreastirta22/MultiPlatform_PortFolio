import 'package:flutter/material.dart';
import 'package:portfolio/design_system/molecules/project_card/sections/project_section.dart';
import 'package:portfolio/design_system/organisms/mobile_hero/mobile_hero_content.dart';
import 'package:portfolio/design_system/organisms/mobile_hero/mobile_hero_cover.dart';
import 'package:portfolio/features/architecture/presentation/sections/architecture_section.dart';
import 'package:portfolio/features/experience/presentation/sections/experience_section.dart';

class MobileHome extends StatelessWidget {
  final ScrollController controller;
  const MobileHome({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: controller,
      slivers: [
        MobileHeroCover(),
        MobileHeroContent(),
        SliverToBoxAdapter(child: ProjectSection()),
        SliverToBoxAdapter(child: ArchitectureSection()),
        SliverToBoxAdapter(child: ExperienceSection()),
      ],
    );
  }
}
