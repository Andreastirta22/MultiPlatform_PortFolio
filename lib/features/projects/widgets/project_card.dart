import 'package:flutter/material.dart';
import 'package:portfolio/theme/components/project_cards/project_card_factory.dart';

import '../models/project_model.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, required this.project});

  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    return ProjectCardFactory.build(context: context, project: project);
  }
}
