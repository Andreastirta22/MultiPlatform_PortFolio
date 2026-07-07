import 'package:flutter/material.dart';

class ExperienceEmptyState extends StatelessWidget {
  const ExperienceEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 420),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.timeline_rounded,
              size: 56,
              color: theme.colorScheme.primary,
            ),

            const SizedBox(height: 24),

            Text("Engineering Journey", style: theme.textTheme.headlineSmall),

            const SizedBox(height: 12),

            Text(
              "Select a milestone from the timeline to explore the engineering story.",
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
