import 'package:flutter/material.dart';
import 'package:portfolio/features/hero/hero_stat.dart';
import 'package:portfolio/features/hero/hero_stat_item.dart';

class HeroStats extends StatelessWidget {
  final List<HeroStat> stats;

  const HeroStats({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: stats.map((e) => HeroStatItem(stat: e)).toList(),
    );
  }
}
