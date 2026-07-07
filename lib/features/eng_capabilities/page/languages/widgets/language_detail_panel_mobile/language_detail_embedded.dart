import 'package:flutter/material.dart';
import 'package:portfolio/features/eng_capabilities/page/languages/models/engineering_languages_models.dart';

class LanguageDetailEmbedded extends StatelessWidget {
  final LanguageModel language;

  const LanguageDetailEmbedded({super.key, required this.language});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: theme.dividerColor.withValues(alpha: .2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            language.description,
            style: theme.textTheme.bodyMedium?.copyWith(height: 1.6),
          ),

          const SizedBox(height: 20),

          _SectionTitle("Proficiency"),

          const SizedBox(height: 8),

          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: language.confidence / 100),
              duration: const Duration(milliseconds: 700),
              curve: Curves.easeOutCubic,
              builder: (context, value, _) {
                return LinearProgressIndicator(
                  value: value,
                  minHeight: 6,
                  backgroundColor: theme.dividerColor.withValues(alpha: .15),
                  valueColor: const AlwaysStoppedAnimation(Color(0xFF6C63FF)),
                );
              },
            ),
          ),

          const SizedBox(height: 24),
          _SectionTitle("Platforms"),

          const SizedBox(height: 12),

          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: language.platforms.map((platform) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(platform.iconAsset, width: 18, height: 18),
                    const SizedBox(width: 8),
                    Text(platform.label, style: theme.textTheme.bodySmall),
                  ],
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 24),

          _SectionTitle("Projects"),

          const SizedBox(height: 12),

          Column(
            children: language.linkedProjects
                .map(
                  (project) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      children: [
                        const Icon(Icons.arrow_right_alt_rounded, size: 18),
                        const SizedBox(width: 8),
                        Expanded(child: Text(project)),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),

          const SizedBox(height: 24),

          _SectionTitle("Tags"),

          const SizedBox(height: 12),

          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: language.tags
                .map((tag) => Chip(label: Text(tag)))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(
        context,
      ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
    );
  }
}
