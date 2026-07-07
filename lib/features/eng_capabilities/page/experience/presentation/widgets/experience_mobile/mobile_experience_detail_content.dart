import 'package:flutter/material.dart';
import 'package:portfolio/features/eng_capabilities/page/experience/models/engineering_experience_model.dart';
import 'package:portfolio/features/eng_capabilities/page/experience/presentation/widgets/experience_detail_header.dart';
import 'package:portfolio/features/eng_capabilities/page/experience/presentation/widgets/experience_detail_impact.dart';
import 'package:portfolio/features/eng_capabilities/page/experience/presentation/widgets/experience_detail_overview.dart';
import 'package:portfolio/features/eng_capabilities/page/experience/presentation/widgets/experience_detail_project.dart';
import 'package:portfolio/features/eng_capabilities/page/experience/presentation/widgets/experience_detail_technology.dart';

class MobileExperienceDetailContent extends StatelessWidget {
  final ExperienceModel experience;

  const MobileExperienceDetailContent({super.key, required this.experience});

  @override
  Widget build(BuildContext context) {
    const spacing = 24.0;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExperienceDetailHeader(experience: experience),

          const SizedBox(height: spacing),

          ExperienceDetailOverview(experience: experience),

          const SizedBox(height: spacing),

          ExperienceDetailImpact(experience: experience),

          const SizedBox(height: spacing),

          ExperienceDetailTechnology(experience: experience),

          const SizedBox(height: spacing),

          ExperienceDetailProjects(experience: experience),
        ],
      ),
    );
  }
}
