import 'package:flutter/material.dart';
import 'package:portfolio/features/eng_capabilities/page/languages/controller/engineering_language_controller.dart';
import 'package:portfolio/features/eng_capabilities/page/languages/widgets/language_detail_panel_mobile/language_accordion_card.dart';
import 'package:provider/provider.dart';

class LanguageAccordionList extends StatelessWidget {
  const LanguageAccordionList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<EngineeringLanguageController>(
      builder: (context, controller, _) {
        final languages = controller.languages;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            children: [
              for (final language in languages) ...[
                LanguageAccordionCard(
                  key: ValueKey(language.id),
                  language: language,
                  isExpanded: controller.expandedId == language.id,
                  onTap: () => controller.toggleExpanded(language),
                ),
                const SizedBox(height: 16),
              ],
            ],
          ),
        );
      },
    );
  }
}
