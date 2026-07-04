import 'package:flutter/material.dart';
import 'package:portfolio/features/hero/content/hero_stat.dart';
import 'package:portfolio/features/hero/content/hero_stat_item.dart';

class HeroStats extends StatelessWidget {
  final List<HeroStat> stats;

  const HeroStats({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.15),
        ),
        color: Theme.of(context).brightness == Brightness.dark
            ? Theme.of(context).colorScheme.surface.withValues(alpha: 0.4)
            : Colors.white,
        boxShadow: [
          if (Theme.of(context).brightness == Brightness.light)
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
        ],
      ),
      child: Wrap(
        spacing: 24,
        runSpacing: 12,
        children: stats.map((e) {
          return HeroStatItem(stat: e);
        }).toList(),
      ),
    );
  }
}
