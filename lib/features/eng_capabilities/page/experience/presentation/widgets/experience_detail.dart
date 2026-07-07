import 'package:flutter/material.dart';
import 'package:portfolio/features/eng_capabilities/page/experience/controller/experience_controller.dart';
import 'package:portfolio/features/eng_capabilities/page/experience/presentation/widgets/experience_desktop/experience_detail_content.dart';

import 'experience_empty_state.dart';

class ExperienceDetail extends StatelessWidget {
  final ExperienceController controller;

  const ExperienceDetail({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final experience = controller.selected;

        if (experience == null) {
          return const ExperienceEmptyState();
        }

        return ExperienceDetailContent(
          key: ValueKey(experience.id),
          experience: experience,
        );
      },
    );
  }
}
