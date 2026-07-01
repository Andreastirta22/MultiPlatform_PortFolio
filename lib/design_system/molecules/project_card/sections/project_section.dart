import 'package:flutter/material.dart';
import 'package:portfolio/features/projects/widgets/project_grid.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    final isMobile = width < 768;
    final isTablet = width < 1200;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile
            ? 24
            : isTablet
            ? 40
            : 80,

        vertical: isMobile ? 80 : 120,
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text("Selected Work"),

          const SizedBox(height: 12),

          Text("Project that blend\nengineering and design"),

          SizedBox(height: isMobile ? 40 : 56),

          const ProjectGrids(),
        ],
      ),
    );
  }
}
