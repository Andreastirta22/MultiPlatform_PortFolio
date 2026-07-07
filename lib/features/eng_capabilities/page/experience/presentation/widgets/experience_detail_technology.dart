import 'package:flutter/material.dart';
import 'package:portfolio/features/eng_capabilities/page/experience/models/engineering_experience_model.dart';

class ExperienceDetailTechnology extends StatelessWidget {
  final ExperienceModel experience;

  const ExperienceDetailTechnology({super.key, required this.experience});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "TECHNOLOGY STACK",
          style: theme.textTheme.labelLarge?.copyWith(
            letterSpacing: 2,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 24),

        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: theme.dividerColor.withValues(alpha: .2)),
          ),
          child: Column(
            children: List.generate(experience.highlights.length, (index) {
              final tech = experience.highlights[index];

              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 20,
                    ),
                    child: Row(
                      children: [
                        Text(
                          (index + 1).toString().padLeft(2, '0'),
                          style: theme.textTheme.labelLarge?.copyWith(
                            color: theme.colorScheme.primary,
                          ),
                        ),

                        const SizedBox(width: 24),

                        Expanded(
                          child: Text(
                            tech,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  if (index != experience.highlights.length - 1)
                    Divider(
                      height: 1,
                      color: theme.dividerColor.withValues(alpha: .2),
                    ),
                ],
              );
            }),
          ),
        ),
      ],
    );
  }
}
