import 'package:flutter/material.dart';
import 'package:portfolio/features/eng_capabilities/page/experience/models/engineering_experience_model.dart';

class ExperienceCard extends StatelessWidget {
  final ExperienceModel experience;
  final VoidCallback? onTap;

  const ExperienceCard({super.key, required this.experience, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: theme.dividerColor.withValues(alpha: .25)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Type
            Text(
              experience.type.toUpperCase(),
              style: theme.textTheme.labelSmall?.copyWith(
                letterSpacing: 2,
                color: theme.colorScheme.primary,
              ),
            ),

            const SizedBox(height: 12),

            /// Company
            Text(
              experience.company,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            /// Role
            Text(experience.role, style: theme.textTheme.titleMedium),

            const SizedBox(height: 20),

            /// Summary
            Text(experience.summary, style: theme.textTheme.bodyMedium),

            const SizedBox(height: 24),

            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: experience.highlights
                  .map(
                    (item) => Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(999),
                        border: Border.all(
                          color: theme.dividerColor.withValues(alpha: .3),
                        ),
                      ),
                      child: Text(item, style: theme.textTheme.labelMedium),
                    ),
                  )
                  .toList(),
            ),

            const SizedBox(height: 24),

            Divider(),

            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: _Metric(label: "Level", value: experience.level),
                ),

                Expanded(
                  child: _Metric(
                    label: "Confidence",
                    value: "${(experience.confidence * 100).round()}%",
                  ),
                ),

                Expanded(
                  child: _Metric(
                    label: "Experience",
                    value: "${experience.yearsExperience} Year",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Metric extends StatelessWidget {
  final String label;
  final String value;

  const _Metric({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: theme.textTheme.labelSmall?.copyWith(letterSpacing: 1.2),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
