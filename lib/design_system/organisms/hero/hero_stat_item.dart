import 'package:flutter/material.dart';
import 'package:portfolio/core/extension/theme_extension.dart';
import 'package:portfolio/design_system/organisms/hero/hero_stat.dart';

class HeroStatItem extends StatelessWidget {
  final HeroStat stat;

  const HeroStatItem({super.key, required this.stat});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.spacing.lg),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(context.radius.large),
        border: Border.all(color: context.colors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            stat.value,
            style: TextStyle(
              fontSize: context.typography.title,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: context.spacing.xs),
          Text(
            stat.label,
            style: TextStyle(fontSize: context.typography.caption),
          ),
        ],
      ),
    );
  }
}
