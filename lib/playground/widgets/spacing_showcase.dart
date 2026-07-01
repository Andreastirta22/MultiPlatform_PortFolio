import 'package:flutter/material.dart';
import 'package:portfolio/core/extension/theme_extension.dart';

class SpacingShowcase extends StatelessWidget {
  const SpacingShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Spacing", style: Theme.of(context).textTheme.headlineMedium),
        SizedBox(height: 24),
        _SpacingTile('XS', spacing.xs),
        _SpacingTile('SM', spacing.sm),
        _SpacingTile('MD', spacing.md),
        _SpacingTile('LG', spacing.lg),
        _SpacingTile('XL', spacing.xl),
        _SpacingTile('XXL', spacing.xxl),
      ],
    );
  }
}

class _SpacingTile extends StatelessWidget {
  final String label;
  final double value;

  const _SpacingTile(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          SizedBox(width: 60, child: Text(label)),
          Container(
            width: value,
            height: 20,
            decoration: BoxDecoration(
              color: context.colors.accent,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(width: 16),
          Text("${value.toInt()} px"),
        ],
      ),
    );
  }
}
