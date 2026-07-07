import 'package:flutter/material.dart';
import 'package:portfolio/features/eng_capabilities/page/certificates/presentation/pages/engineering_certificates.dart';
import 'package:portfolio/features/eng_capabilities/page/experience/presentation/pages/engineering_experience.dart';
import 'package:portfolio/features/eng_capabilities/page/languages/engineering_languages.dart';

class EngineeringContent extends StatelessWidget {
  final int currentTab;

  const EngineeringContent({super.key, required this.currentTab});

  @override
  Widget build(BuildContext context) {
    return _buildContent();
  }

  Widget _buildContent() {
    switch (currentTab) {
      case 0:
        return const EngineeringLanguages(key: ValueKey("languages"));

      case 1:
        return const EngineeringExperience(key: ValueKey("experience"));

      case 2:
        return const EngineeringCertificates(key: ValueKey("certificates"));

      default:
        return const SizedBox.shrink();
    }
  }
}
