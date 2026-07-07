import 'package:flutter/material.dart';
import 'package:portfolio/features/eng_capabilities/page/experience/models/engineering_experience_model.dart';

class ExperienceDetailOverview extends StatelessWidget {
  final ExperienceModel experience;

  const ExperienceDetailOverview({super.key, required this.experience});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: theme.dividerColor.withValues(alpha: .2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "OVERVIEW",
            style: theme.textTheme.labelLarge?.copyWith(
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.primary,
            ),
          ),

          const SizedBox(height: 24),

          Text(
            experience.summary,
            style: theme.textTheme.bodyLarge?.copyWith(height: 1.8),
          ),
        ],
      ),
    );
  }
}
