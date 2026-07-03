import 'package:flutter/material.dart';
import 'package:portfolio/features/architecture/presentation/sections/architecture_section.dart';
import 'package:portfolio/features/experience_banner/section/experience_banner_section.dart';
import 'package:portfolio/features/hero/mobile_hero/mobile_hero_content.dart';
import 'package:portfolio/features/hero/mobile_hero/mobile_hero_cover.dart';
import 'package:portfolio/features/projects/sections/project_section.dart';
import 'package:portfolio/theme/controller/theme_controller.dart';

class MobileHome extends StatelessWidget {
  final ScrollController controller;
  const MobileHome({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = ThemeController();
    return CustomScrollView(
      controller: controller,
      slivers: [
        MobileHeroCover(),
        MobileHeroContent(),
        SliverToBoxAdapter(child: ProjectSection()),
        SliverToBoxAdapter(child: ArchitectureSection()),
        SliverToBoxAdapter(
          child: ExperienceBannerSection(themeController: themeController),
        ),
      ],
    );
  }
}
