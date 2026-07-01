import 'package:flutter/material.dart';
import 'package:portfolio/features/projects/widgets/project_grid.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 120),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Selected Work"),
          const SizedBox(height: 12),
          Text("Project that blend\nengineering and design"),
          const SizedBox(height: 56),
          const ProjectGrid(),
        ],
      ),
    );
  }
}
