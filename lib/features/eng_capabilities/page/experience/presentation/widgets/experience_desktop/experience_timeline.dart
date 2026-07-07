import 'package:flutter/material.dart';
import 'package:portfolio/core/extension/responsive_extension.dart';
import 'package:portfolio/features/eng_capabilities/page/experience/controller/experience_controller.dart';
import 'package:portfolio/features/eng_capabilities/page/experience/models/engineering_experience_model.dart';
import 'package:portfolio/features/eng_capabilities/page/experience/presentation/widgets/experience_desktop/experience_timeline_node.dart';
import 'package:portfolio/features/eng_capabilities/page/experience/presentation/widgets/experience_mobile/mobile_experience_timeline_node.dart';

class ExperienceTimeline extends StatelessWidget {
  final List<ExperienceModel> experiences;
  final ExperienceController controller;

  const ExperienceTimeline({
    super.key,
    required this.experiences,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        final config = _TimelineConfig.fromWidth(width);
        final isMobile = context.isPhone;

        return Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: config.maxWidth),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: config.horizontalPadding,
                vertical: config.verticalPadding,
              ),
              child: Column(
                children: List.generate(
                  experiences.length,
                  (index) => Padding(
                    padding: EdgeInsets.only(
                      bottom: index == experiences.length - 1
                          ? 0
                          : config.itemSpacing,
                    ),
                    child: isMobile
                        ? MobileExperienceTimelineNode(
                            experience: experiences[index],
                            controller: controller,
                          )
                        : ExperienceTimelineNode(
                            experience: experiences[index],
                            controller: controller,
                            isFirst: index == 0,
                            isLast: index == experiences.length - 1,
                          ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _TimelineConfig {
  final bool isMobile;
  final bool isTablet;
  final bool isDesktop;
  final double maxWidth;
  final double horizontalPadding;
  final double verticalPadding;
  final double itemSpacing;
  final bool expandable;
  final bool showTimelineRail;

  const _TimelineConfig({
    required this.isMobile,
    required this.isTablet,
    required this.isDesktop,
    required this.maxWidth,
    required this.horizontalPadding,
    required this.verticalPadding,
    required this.itemSpacing,
    required this.expandable,
    required this.showTimelineRail,
  });

  factory _TimelineConfig.fromWidth(double width) {
    if (width < 600) {
      return const _TimelineConfig(
        isMobile: true,
        isTablet: false,
        isDesktop: false,
        maxWidth: double.infinity,
        horizontalPadding: 12,
        verticalPadding: 12,
        itemSpacing: 20,
        expandable: true,
        showTimelineRail: false,
      );
    }

    if (width < 1024) {
      return const _TimelineConfig(
        isMobile: false,
        isTablet: true,
        isDesktop: false,
        maxWidth: 760,
        horizontalPadding: 24,
        verticalPadding: 20,
        itemSpacing: 28,
        expandable: false,
        showTimelineRail: true,
      );
    }

    return const _TimelineConfig(
      isMobile: false,
      isTablet: false,
      isDesktop: true,
      maxWidth: 900,
      horizontalPadding: 40,
      verticalPadding: 32,
      itemSpacing: 40,
      expandable: false,
      showTimelineRail: true,
    );
  }
}
