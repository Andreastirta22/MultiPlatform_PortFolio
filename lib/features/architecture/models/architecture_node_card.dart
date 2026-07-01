import 'package:flutter/material.dart';
import 'package:portfolio/core/extension/theme_extension.dart';
import 'package:portfolio/features/architecture/models/architecture_node.dart';

class ArchitectureNodeCard extends StatelessWidget {
  final ArchitectureNode node;

  const ArchitectureNodeCard({super.key, required this.node});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: colors.border),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: colors.accent.withValues(alpha: .08),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Icon(node.icon, color: colors.accent),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  node.title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 4),
                Text(node.subtitle),
                SizedBox(height: 14),
                Text(node.description),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
