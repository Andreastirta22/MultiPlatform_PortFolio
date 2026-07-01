import 'package:flutter/material.dart';
import 'package:portfolio/features/architecture/presentation/widgets/architecture_flow.dart';
import 'package:portfolio/features/architecture/presentation/widgets/architecture_intro.dart';

class ArchitectureSection extends StatelessWidget {
  const ArchitectureSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    final mobile = width < 768;
    final tablet = width < 1200;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: mobile
            ? 24
            : tablet
            ? 40
            : 80,
        vertical: 120,
      ),
      child: mobile
          ? Column(
              children: [
                ArchitectureIntro(),
                SizedBox(height: 48),
                ArchitectureFlow(),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 4, child: ArchitectureIntro()),
                SizedBox(width: 72),
                Expanded(flex: 6, child: ArchitectureFlow()),
              ],
            ),
    );
  }
}
