import 'package:flutter/material.dart';
import 'package:portfolio/core/extension/theme_extension.dart';

class RadiusShowcase extends StatelessWidget {
  const RadiusShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final radius = context.radius;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Radius", style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 24),
        Wrap(
          spacing: 24,
          runSpacing: 24,
          children: [
            _RadiusCard('Small', radius.small),
            _RadiusCard('Medium', radius.medium),
            _RadiusCard('Large', radius.large),
            _RadiusCard('Extra Large', radius.extraLarge),
          ],
        ),
      ],
    );
  }
}

class _RadiusCard extends StatelessWidget {
  final String label;
  final double radius;
  const _RadiusCard(this.label, this.radius);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: context.colors.surface,
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(color: context.colors.border),
          ),
        ),
        const SizedBox(height: 12),
        Text("$label(${radius.toInt()})"),
      ],
    );
  }
}
