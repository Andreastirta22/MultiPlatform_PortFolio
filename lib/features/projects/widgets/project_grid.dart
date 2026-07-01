import 'package:flutter/material.dart';
import 'package:portfolio/features/projects/data/dummy_data_projects.dart';
import 'package:portfolio/features/projects/widgets/project_card.dart';

class ProjectGrids extends StatefulWidget {
  const ProjectGrids({super.key});

  @override
  State<ProjectGrids> createState() => _ProjectGridsState();
}

class _ProjectGridsState extends State<ProjectGrids> {
  int currentPage = 0;
  late final ScrollController controller;

  @override
  void initState() {
    super.initState();
    controller = ScrollController();
    controller.addListener(() {
      final index = (controller.offset / (320 + 16)).round();
      if (index != currentPage && index < projects.length) {
        setState(() {
          currentPage = index;
        });
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    if (width >= 1200) {
      return _desktop();
    }
    if (width >= 768) {
      return _tablet();
    }
    return _mobile(context);
  }

  Widget _desktop() {
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

  Widget _tablet() {
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

  Widget _mobile(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final cardWidth = width - 72;

    return Column(
      children: [
        SizedBox(
          height: 390,
          child: ListView.separated(
            controller: controller,
            padding: const EdgeInsets.only(left: 24, right: 24),
            scrollDirection: Axis.horizontal,
            itemCount: projects.length,
            itemBuilder: (_, index) {
              return SizedBox(
                width: cardWidth.clamp(260.0, 320.0).toDouble(),
                child: ProjectCard(project: projects[index]),
              );
            },
            separatorBuilder: (_, __) => const SizedBox(width: 16),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(projects.length, (index) {
            final active = currentPage == index;
            return AnimatedContainer(
              duration: Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: active ? 24 : 6,
              height: 6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(999),
                color: active
                    ? Colors.white
                    : Colors.white.withValues(alpha: .2),
              ),
            );
          }),
        ),
      ],
    );
  }
}
