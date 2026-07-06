import 'package:flutter/material.dart';
import 'package:portfolio/features/eng_capabilities/page/languages/controller/engineering_language_controller.dart';
import 'package:portfolio/features/eng_capabilities/page/languages/widgets/language_detail_embedded.dart';
import 'package:portfolio/features/eng_capabilities/page/languages/widgets/language_empty_state.dart';
import 'package:portfolio/features/eng_capabilities/page/languages/widgets/language_grid.dart';
import 'package:provider/provider.dart';

class TabletLanguagesLayout extends StatelessWidget {
  const TabletLanguagesLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<EngineeringLanguageController>(
      builder: (context, controller, _) {
        return Column(
          children: [
            Expanded(
              child: LanguageGrid(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              ),
            ),

            const SizedBox(height: 24),

            if (controller.selectedLanguage != null)
              LanguageDetailEmbedded(language: controller.selectedLanguage!)
            else
              const LanguageEmptyState(),
          ],
        );
      },
    );
  }
}
