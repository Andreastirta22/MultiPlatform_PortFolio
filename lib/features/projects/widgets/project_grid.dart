import 'package:flutter/material.dart';
import 'package:portfolio/features/projects/data/dummy_data_projects.dart';
import 'package:portfolio/features/projects/widgets/project_card.dart';

class ProjectGrid extends StatelessWidget {
  const ProjectGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    final isDesktop = width >= 1200;
    final isTablet = width >= 768 && width < 1200;
    if (isDesktop) {
      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: projects.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 24,
          crossAxisSpacing: 24,
          childAspectRatio: .82,
        ),
        itemBuilder: (_, index) {
          return ProjectCard(project: projects[index]);
        },
      );
    }
    if (isTablet) {
      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: projects.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 24,
          crossAxisSpacing: 24,
          childAspectRatio: .82,
        ),
        itemBuilder: (_, index) {
          return ProjectCard(project: projects[index]);
        },
      );
    }

    return SizedBox(
      height: 420,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: projects.length,
        itemBuilder: (_, index) {
          return SizedBox(
            width: 320,
            child: ProjectCard(project: projects[index]),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: 16),
      ),
    );
  }
}
