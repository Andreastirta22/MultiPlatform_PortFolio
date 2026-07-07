import 'package:flutter/material.dart';
import 'package:portfolio/features/eng_capabilities/page/experience/controller/experience_controller.dart';
import 'package:portfolio/features/eng_capabilities/page/experience/models/engineering_experience_model.dart';
import 'package:portfolio/features/eng_capabilities/page/experience/presentation/widgets/experience_mobile/mobile_experience_timeline.dart';

class MobileExperienceLayout extends StatelessWidget {
  final List<ExperienceModel> experiences;
  final ExperienceController controller;

  const MobileExperienceLayout({
    super.key,
    required this.experiences,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: MobileExperienceTimeline(
        experiences: experiences,
        controller: controller,
      ),
    );
  }
}
