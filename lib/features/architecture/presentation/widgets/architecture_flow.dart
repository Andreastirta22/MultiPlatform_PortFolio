import 'package:flutter/material.dart';
import 'package:portfolio/core/extension/theme_extension.dart';
import 'package:portfolio/features/architecture/data/archtecture_data.dart';
import 'package:portfolio/features/architecture/models/architecture_node.dart';
import 'package:portfolio/features/architecture/models/architecture_node_card.dart';

class ArchitectureFlow extends StatelessWidget {
  const ArchitectureFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(architectureNodes.length, (index) {
        final node = architectureNodes[index];

        return ArchitectureFlowItem(
          node: node,
          last: index == architectureNodes.length - 1,
        );
      }),
    );
  }
}

class ArchitectureFlowItem extends StatelessWidget {
  final ArchitectureNode node;
  final bool last;

  const ArchitectureFlowItem({
    super.key,
    required this.node,
    required this.last,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ArchitectureNodeCard(node: node),

        if (!last) const Connector(),
      ],
    );
  }
}

class Connector extends StatelessWidget {
  const Connector({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        height: 48,
        child: Column(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.colors.accent,
              ),
            ),
            const SizedBox(height: 6),
            Expanded(
              child: Container(
                width: 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(999),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      context.colors.accent,
                      context.colors.accent.withValues(alpha: .08),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
