import 'package:flutter/material.dart';
import 'package:portfolio/features/eng_capabilities/page/experience/controller/experience_controller.dart';
import 'package:portfolio/features/eng_capabilities/page/experience/models/engineering_experience_model.dart';
import 'package:portfolio/features/eng_capabilities/page/experience/presentation/widgets/experience_desktop/experience_timeline.dart';
import 'package:portfolio/features/eng_capabilities/page/experience/presentation/widgets/experience_detail.dart';

class TabletExperienceLayout extends StatelessWidget {
  final List<ExperienceModel> experiences;
  final ExperienceController controller;

  const TabletExperienceLayout({
    super.key,
    required this.experiences,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Timeline
        Expanded(
          flex: 4,
          child: ExperienceTimeline(
            experiences: experiences,
            controller: controller,
          ),
        ),

        const SizedBox(width: 48),

        /// Detail Panel
        Expanded(flex: 6, child: ExperienceDetail(controller: controller)),
      ],
    );
  }
}
