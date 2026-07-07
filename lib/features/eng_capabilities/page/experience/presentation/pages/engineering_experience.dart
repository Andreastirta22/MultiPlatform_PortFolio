import 'package:flutter/material.dart';
import 'package:portfolio/features/eng_capabilities/page/experience/controller/experience_controller.dart';
import 'package:portfolio/features/eng_capabilities/page/experience/section/experience_section.dart';

class EngineeringExperience extends StatefulWidget {
  const EngineeringExperience({super.key});

  @override
  State<EngineeringExperience> createState() => _EngineeringExperienceState();
}

class _EngineeringExperienceState extends State<EngineeringExperience> {
  late final ExperienceController controller;
  @override
  void initState() {
    super.initState();
    controller = ExperienceController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ExperienceSection(controller: controller);
  }
}
