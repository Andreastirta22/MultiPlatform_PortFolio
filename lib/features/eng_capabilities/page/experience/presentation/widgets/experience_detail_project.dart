import 'package:flutter/material.dart';
import 'package:portfolio/features/eng_capabilities/page/experience/models/engineering_experience_model.dart';

class ExperienceDetailProjects extends StatelessWidget {
  final ExperienceModel experience;

  const ExperienceDetailProjects({super.key, required this.experience});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (experience.linkedProjects.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "RELATED PROJECTS",
          style: theme.textTheme.labelLarge?.copyWith(
            letterSpacing: 2,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 24),

        ...experience.linkedProjects.map((project) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: _ProjectCard(title: project),
          );
        }),
      ],
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final String title;

  const _ProjectCard({required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        // nanti navigation ke project detail
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: theme.dividerColor.withValues(alpha: .2)),
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: theme.colorScheme.primary.withValues(alpha: .1),
              ),
              child: Icon(
                Icons.arrow_outward_rounded,
                size: 20,
                color: theme.colorScheme.primary,
              ),
            ),

            const SizedBox(width: 20),

            Expanded(
              child: Text(
                title,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            Icon(
              Icons.chevron_right_rounded,
              color: theme.colorScheme.onSurface.withValues(alpha: .5),
            ),
          ],
        ),
      ),
    );
  }
}
