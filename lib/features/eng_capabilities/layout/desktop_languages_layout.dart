import 'package:flutter/material.dart';
import 'package:portfolio/features/eng_capabilities/page/languages/widgets/language_detail_panel.dart';
import 'package:portfolio/features/eng_capabilities/page/languages/widgets/language_grid.dart';

class DesktopLanguagesLayout extends StatelessWidget {
  const DesktopLanguagesLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 5,
          child: LanguageGrid(
            crossAxisCount: 3,
            physics: const BouncingScrollPhysics(),
          ),
        ),
        const SizedBox(width: 24),
        Expanded(flex: 4, child: LanguageDetailPanel()),
      ],
    );
  }
}
