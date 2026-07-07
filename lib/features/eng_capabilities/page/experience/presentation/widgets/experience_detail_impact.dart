import 'package:flutter/material.dart';
import 'package:portfolio/features/eng_capabilities/page/experience/models/engineering_experience_model.dart';

class ExperienceDetailImpact extends StatelessWidget {
  final ExperienceModel experience;

  const ExperienceDetailImpact({super.key, required this.experience});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "ENGINEERING CONTRIBUTIONS",
          style: theme.textTheme.labelLarge?.copyWith(
            letterSpacing: 2,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 24),

        ...List.generate(
          experience.impacts.length,
          (index) => Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: _ImpactCard(
              index: index + 1,
              description: experience.impacts[index],
            ),
          ),
        ),
      ],
    );
  }
}

class _ImpactCard extends StatelessWidget {
  final int index;
  final String description;

  const _ImpactCard({required this.index, required this.description});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: theme.dividerColor.withValues(alpha: .2)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withValues(alpha: .08),
              shape: BoxShape.circle,
            ),
            child: Text(
              index.toString().padLeft(2, '0'),
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(width: 20),

          Expanded(
            child: Text(
              description,
              style: theme.textTheme.bodyLarge?.copyWith(height: 1.7),
            ),
          ),
        ],
      ),
    );
  }
}
