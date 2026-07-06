import 'package:flutter/material.dart';
import 'package:portfolio/features/eng_capabilities/page/languages/models/engineering_languages_models.dart';
import 'package:portfolio/features/eng_capabilities/page/languages/widgets/language_card.dart';
import 'package:portfolio/features/eng_capabilities/page/languages/widgets/language_detail_embedded.dart';

class LanguageAccordionCard extends StatelessWidget {
  final LanguageModel language;
  final bool isExpanded;
  final VoidCallback onTap;

  const LanguageAccordionCard({
    super.key,
    required this.language,
    required this.isExpanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        LanguageCard(language: language, isSelected: isExpanded, onTap: onTap),

        ClipRect(
          child: AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOutCubic,
            alignment: Alignment.topCenter,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              switchInCurve: Curves.easeOut,
              switchOutCurve: Curves.easeIn,
              child: isExpanded
                  ? Padding(
                      key: ValueKey(language.id),
                      padding: const EdgeInsets.only(top: 12),
                      child: LanguageDetailEmbedded(language: language),
                    )
                  : const SizedBox.shrink(),
            ),
          ),
        ),
      ],
    );
  }
}
