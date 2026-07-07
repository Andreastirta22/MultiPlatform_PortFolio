import 'package:flutter/material.dart';
import 'package:portfolio/features/eng_capabilities/page/experience/models/engineering_experience_model.dart';

class ExperienceDetailHeader extends StatelessWidget {
  final ExperienceModel experience;

  const ExperienceDetailHeader({super.key, required this.experience});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${experience.period} • ${experience.type.toUpperCase()}",
          style: theme.textTheme.labelLarge?.copyWith(
            letterSpacing: 2,
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 20),

        Text(
          experience.company,
          style: theme.textTheme.displaySmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 8),

        Text(experience.role, style: theme.textTheme.headlineSmall),

        const SizedBox(height: 24),

        Text(
          experience.summary,
          style: theme.textTheme.bodyLarge?.copyWith(height: 1.7),
        ),

        const SizedBox(height: 32),

        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            _Metric(title: "Level", value: experience.level),
            _Metric(
              title: "Confidence",
              value: "${(experience.confidence * 100).round()}%",
            ),
            _Metric(
              title: "Experience",
              value: "${experience.yearsExperience}+ Year",
            ),
          ],
        ),

        const SizedBox(height: 32),

        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: experience.highlights.map((tech) {
            return _TechBadge(label: tech);
          }).toList(),
        ),

        const SizedBox(height: 36),

        Divider(color: theme.dividerColor.withValues(alpha: .2)),
      ],
    );
  }
}

class _Metric extends StatelessWidget {
  final String title;
  final String value;

  const _Metric({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      constraints: const BoxConstraints(minWidth: 140),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toUpperCase(),
            style: theme.textTheme.labelSmall?.copyWith(letterSpacing: 1.4),
          ),

          const SizedBox(height: 6),

          Text(
            value,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _TechBadge extends StatelessWidget {
  final String label;

  const _TechBadge({required this.label});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: theme.dividerColor.withValues(alpha: .3)),
      ),
      child: Text(label, style: theme.textTheme.labelMedium),
    );
  }
}
