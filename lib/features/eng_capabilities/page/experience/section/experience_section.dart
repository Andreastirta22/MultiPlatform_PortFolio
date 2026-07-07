import 'package:flutter/material.dart';
import 'package:portfolio/features/eng_capabilities/page/experience/data/experience_dummy.dart';
import 'package:portfolio/features/eng_capabilities/page/experience/layout/desktop_experience_layout.dart';
import 'package:portfolio/features/eng_capabilities/page/experience/layout/mobile_experience_layout.dart';
import 'package:portfolio/features/eng_capabilities/page/experience/layout/tablet_experience_layout.dart';

import '../controller/experience_controller.dart';

class ExperienceSection extends StatelessWidget {
  final ExperienceController controller;

  const ExperienceSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        final width = constraints.maxWidth;

        Widget child;

        if (width < 600) {
          child = MobileExperienceLayout(
            experiences: experienceDummy,
            controller: controller,
          );
        } else if (width < 1024) {
          child = TabletExperienceLayout(
            experiences: experienceDummy,
            controller: controller,
          );
        } else {
          child = DesktopExperienceLayout(
            experiences: experienceDummy,
            controller: controller,
          );
        }

        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          child: KeyedSubtree(
            key: ValueKey(
              width < 600
                  ? 'mobile'
                  : width < 1024
                  ? 'tablet'
                  : 'desktop',
            ),
            child: child,
          ),
        );
      },
    );
  }
}
