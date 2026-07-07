import 'package:flutter/material.dart';
import 'package:portfolio/features/eng_capabilities/page/experience/controller/experience_controller.dart';
import 'package:portfolio/features/eng_capabilities/page/experience/models/engineering_experience_model.dart';
import 'package:portfolio/features/eng_capabilities/page/experience/presentation/widgets/experience_card.dart';
import 'package:portfolio/features/eng_capabilities/page/experience/presentation/widgets/experience_mobile/mobile_experience_detail_content.dart';

class MobileExperienceTimelineNode extends StatelessWidget {
  final ExperienceModel experience;
  final ExperienceController controller;

  const MobileExperienceTimelineNode({
    super.key,
    required this.experience,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final expanded = controller.isSelected(experience);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExperienceCard(
          experience: experience,
          onTap: () {
            controller.toggle(experience);
          },
        ),

        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,

          child: expanded
              ? Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: MobileExperienceDetailContent(experience: experience),
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
