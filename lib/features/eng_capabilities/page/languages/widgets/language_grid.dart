import 'package:flutter/material.dart';
import 'package:portfolio/features/eng_capabilities/page/languages/widgets/language_card.dart';
import 'package:provider/provider.dart';

import '../controller/engineering_language_controller.dart';

class LanguageGrid extends StatelessWidget {
  final int crossAxisCount;
  final bool shrinkWrap;
  final ScrollPhysics physics;
  final VoidCallback? onSelect;

  const LanguageGrid({
    super.key,
    required this.crossAxisCount,
    required this.physics,
    this.shrinkWrap = false,
    this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<EngineeringLanguageController>(
      builder: (context, controller, _) {
        final languages = controller.languages;
        return LayoutBuilder(
          builder: (context, constraints) {
            final crossAxisCount = _getCrossAxisCount(constraints.maxWidth);
            return GridView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(16),
              itemCount: languages.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.4,
              ),
              itemBuilder: (context, index) {
                final language = languages[index];
                final isSelected =
                    controller.selectedLanguage?.id == language.id;
                return LanguageCard(
                  language: language,
                  isSelected: isSelected,
                  onTap: () {
                    controller.selectLanguage(language);
                    onSelect?.call();
                  },
                );
              },
            );
          },
        );
      },
    );
  }

  int _getCrossAxisCount(double width) {
    if (width >= 1400) return 4;
    if (width >= 1100) return 3;
    if (width >= 700) return 2;
    return 1;
  }
}
