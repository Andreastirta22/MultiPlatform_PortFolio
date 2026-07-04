import 'package:flutter/material.dart';
import 'package:portfolio/features/architecture/pages/architecture_section.dart';
import 'package:portfolio/features/experience_banner/section/experience_banner_section.dart';
import 'package:portfolio/features/hero/mobile_hero/mobile_hero_cover.dart';
import 'package:portfolio/features/introduction/presentation/pages/introduction_section.dart';
// import 'package:portfolio/features/hero/mobile_hero/mobile_hero_cover.dart';
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
        SliverToBoxAdapter(child: IntroductionSection()),
        SliverToBoxAdapter(child: ProjectSection()),
        SliverToBoxAdapter(child: ArchitectureSection()),
        SliverToBoxAdapter(
          child: ExperienceBannerSection(themeController: themeController),
        ),
        SliverToBoxAdapter(child: _SectionPlaceholder(label: "Footer")),
      ],
    );
  }
}

class _SectionPlaceholder extends StatelessWidget {
  final String label;
  const _SectionPlaceholder({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 480,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.white.withValues(alpha: 0.06)),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white.withValues(alpha: 0.25),
          fontSize: 14,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}
