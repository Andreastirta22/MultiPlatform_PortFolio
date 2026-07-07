import 'package:flutter/material.dart';
import 'package:portfolio/features/eng_capabilities/page/experience/controller/experience_controller.dart';
import 'package:portfolio/features/eng_capabilities/page/experience/models/engineering_experience_model.dart';
import 'package:portfolio/features/eng_capabilities/page/experience/presentation/widgets/experience_mobile/mobile_experience_timeline_node.dart';

class MobileExperienceTimeline extends StatelessWidget {
  final List<ExperienceModel> experiences;
  final ExperienceController controller;

  const MobileExperienceTimeline({
    super.key,
    required this.experiences,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return Column(
          children: List.generate(
            experiences.length,
            (index) => Padding(
              padding: EdgeInsets.only(
                bottom: index == experiences.length - 1 ? 0 : 20,
              ),
              child: MobileExperienceTimelineNode(
                experience: experiences[index],
                controller: controller,
              ),
            ),
          ),
        );
      },
    );
  }
}
