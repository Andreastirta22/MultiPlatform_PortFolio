import 'package:flutter/material.dart';
import 'package:portfolio/features/eng_capabilities/page/experience/models/engineering_experience_model.dart';
import 'package:portfolio/features/eng_capabilities/page/experience/presentation/widgets/experience_detail_header.dart';
import 'package:portfolio/features/eng_capabilities/page/experience/presentation/widgets/experience_detail_impact.dart';
import 'package:portfolio/features/eng_capabilities/page/experience/presentation/widgets/experience_detail_overview.dart';
import 'package:portfolio/features/eng_capabilities/page/experience/presentation/widgets/experience_detail_project.dart';
import 'package:portfolio/features/eng_capabilities/page/experience/presentation/widgets/experience_detail_technology.dart';

class ExperienceDetailContent extends StatelessWidget {
  final ExperienceModel experience;

  const ExperienceDetailContent({super.key, required this.experience});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        final padding = width < 600
            ? 20.0
            : width < 1024
            ? 28.0
            : 40.0;

        final spacing = width < 600
            ? 32.0
            : width < 1024
            ? 40.0
            : 56.0;

        final maxWidth = width < 1024 ? width : 960.0;

        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 350),
          child: SingleChildScrollView(
            key: ValueKey(experience.id),
            padding: EdgeInsets.all(padding),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxWidth),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ExperienceDetailHeader(experience: experience),

                    SizedBox(height: spacing),

                    ExperienceDetailOverview(experience: experience),

                    SizedBox(height: spacing),

                    ExperienceDetailImpact(experience: experience),

                    SizedBox(height: spacing),

                    ExperienceDetailTechnology(experience: experience),

                    SizedBox(height: spacing),

                    ExperienceDetailProjects(experience: experience),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
