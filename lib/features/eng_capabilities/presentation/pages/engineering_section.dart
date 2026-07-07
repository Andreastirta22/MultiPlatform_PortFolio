import 'package:flutter/material.dart';
import 'package:portfolio/features/eng_capabilities/controller/engineering_controller.dart';
import 'package:portfolio/features/eng_capabilities/data/engineering_data.dart';
import 'package:portfolio/features/eng_capabilities/presentation/widgets/engineering_content.dart';
import 'package:portfolio/features/eng_capabilities/presentation/widgets/engineering_header.dart';
import 'package:portfolio/features/eng_capabilities/presentation/widgets/engineering_snapshot.dart';
import 'package:provider/provider.dart';

class EngineeringSection extends StatelessWidget {
  const EngineeringSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => EngineeringController(capabilities: engineeringData),
      child: const _EngineeringSectionView(),
    );
  }
}

class _EngineeringSectionView extends StatelessWidget {
  const _EngineeringSectionView();

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<EngineeringController>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const EngineeringHeader(
            sectionLabel: "SECTION 04",
            title: "Engineering Capabilities",
            subtitle: "One Codebase. Multiple Platforms. Infinite Experiences.",
            statuses: [
              "Flutter Runtime",
              "Firebase Ready",
              "Theme Aware",
              "Responsive",
            ],
          ),
          const SizedBox(height: 40),
          const EngineeringSnapshot(),
          const SizedBox(height: 40),
          Row(
            children: [
              TextButton(
                onPressed: () => controller.changeTab(0),
                child: const Text("Languages"),
              ),
              TextButton(
                onPressed: () => controller.changeTab(1),
                child: const Text("Experience"),
              ),
              TextButton(
                onPressed: () => controller.changeTab(2),
                child: const Text("Certificates"),
              ),
            ],
          ),
          const SizedBox(height: 30),
          EngineeringContent(currentTab: controller.currentTab),
        ],
      ),
    );
  }
}
