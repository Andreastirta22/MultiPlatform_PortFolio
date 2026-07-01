import 'package:flutter/material.dart';
import 'package:portfolio/core/extension/theme_extension.dart';
import 'package:portfolio/features/projects/models/project_model.dart';

class ProjectContent extends StatelessWidget {
  final ProjectModel project;

  const ProjectContent({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          project.title,

          style: TextStyle(
            fontSize: context.typography.title,

            fontWeight: FontWeight.w600,
          ),
        ),

        SizedBox(height: context.spacing.sm),

        Text(project.subtitle),

        SizedBox(height: context.spacing.md),

        Text(project.techs.join(" • ")),
      ],
    );
  }
}
