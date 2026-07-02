import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/features/experience/data/experience_data.dart';
import 'package:portfolio/features/experience/presentation/widgets/experience_card.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final items = experienceData;
    final width = MediaQuery.of(context).size.width;

    final isMobile = width < 600;
    final isTablet = width >= 600 && width < 1024;
    final horizontalPadding = isMobile
        ? 16.0
        : isTablet
        ? 20.0
        : 24.0;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 900),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "EXPERIENCE",
                style: Theme.of(context).textTheme.labelMedium,
              ),

              const SizedBox(height: 12),

              Text(
                "A summary of my professional journey in building systems and leading teams",
                style: isMobile
                    ? Theme.of(context).textTheme.titleMedium
                    : Theme.of(context).textTheme.displaySmall,
              ),

              SizedBox(height: isMobile ? 24 : 60),

              Column(
                children: List.generate(items.length, (index) {
                  final item = items[index];

                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: isMobile
                          ? 12
                          : isTablet
                          ? 20
                          : 28,
                    ),
                    child: ExperienceFlowItem(
                      item: item,
                      index: index,
                      last: index == items.length - 1,
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ExperienceFlowItem extends StatefulWidget {
  final dynamic item;
  final int index;
  final bool last;

  const ExperienceFlowItem({
    super.key,
    required this.item,
    required this.index,
    required this.last,
  });

  @override
  State<ExperienceFlowItem> createState() => _ExperienceFlowItemState();
}

class _ExperienceFlowItemState extends State<ExperienceFlowItem> {
  double progress = 0;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.item.role),

      onVisibilityChanged: (info) {
        final p = info.visibleFraction.clamp(0.0, 1.0);

        if ((p - progress).abs() < 0.05) return;
        setState(() => progress = p);
      },

      child: Transform.translate(
        offset: Offset(0, lerpDouble(30, 0, progress)!),

        child: Opacity(
          opacity: lerpDouble(0.4, 1, progress)!,

          child: Transform.scale(
            scale: lerpDouble(0.96, 1, progress)!,

            child: ExperienceCard(item: widget.item, isActive: progress > 0.7),
          ),
        ),
      ),
    );
  }
}
