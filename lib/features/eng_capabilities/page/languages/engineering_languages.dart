import 'package:flutter/material.dart';
import 'package:portfolio/features/eng_capabilities/layout/desktop_languages_layout.dart';
import 'package:portfolio/features/eng_capabilities/layout/mobile_languages_layout.dart';
import 'package:portfolio/features/eng_capabilities/layout/tablet_langages_layout.dart';
import 'package:portfolio/features/eng_capabilities/page/languages/controller/engineering_language_controller.dart';
import 'package:portfolio/features/eng_capabilities/page/languages/data/language_mock_data.dart';
import 'package:provider/provider.dart';

class EngineeringLanguages extends StatelessWidget {
  const EngineeringLanguages({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => EngineeringLanguageController(LanguageMockData.languages),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 1100) {
            return const DesktopLanguagesLayout();
          }

          if (constraints.maxWidth >= 700) {
            return const TabletLanguagesLayout();
          }

          return const MobileLanguagesLayout();
        },
      ),
    );
  }
}

// class _LanguagesShell extends StatelessWidget {
//   const _LanguagesShell();

//   @override
//   Widget build(BuildContext context) {
//     return const _LanguagesLayout();
//   }
// }

// class _LanguagesLayout extends StatefulWidget {
//   const _LanguagesLayout();

//   @override
//   State<_LanguagesLayout> createState() => _LanguagesLayoutState();
// }

// class _LanguagesLayoutState extends State<_LanguagesLayout> {
//   final GlobalKey _detailKey = GlobalKey();

//   void _scrollToDetail() {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       final context = _detailKey.currentContext;
//       if (context == null) return;

//       Scrollable.ensureVisible(
//         context,
//         duration: const Duration(milliseconds: 500),
//         curve: Curves.easeOutCubic,
//         alignment: 0.1,
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final isDesktop = width >= 900;

//     return AnimatedSwitcher(
//       duration: const Duration(milliseconds: 300),
//       child: isDesktop
//           ? Row(
//               key: const ValueKey("desktop"),
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Expanded(
//                   flex: 5,
//                   child: LanguageGrid(onSelect: _scrollToDetail),
//                 ),
//                 const SizedBox(width: 24),
//                 Expanded(flex: 4, child: LanguageDetailPanel(key: _detailKey)),
//               ],
//             )
//           : const _MobileLayout(key: ValueKey("mobile")),
//     );
//   }
// }

// // class _DesktopLayout extends StatelessWidget {
// //   final VoidCallback? onSelect;

// //   const _DesktopLayout({super.key, this.onSelect});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Row(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         Expanded(flex: 5, child: LanguageGrid(onSelect: onSelect)),
// //         const SizedBox(width: 24),
// //         const Expanded(flex: 4, child: LanguageDetailPanel()),
// //       ],
// //     );
// //   }
// // }

// class _MobileLayout extends StatelessWidget {
//   const _MobileLayout({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<EngineeringLanguageController>(
//       builder: (context, controller, _) {
//         final lang = controller.selectedLanguage;

//         return AnimatedSwitcher(
//           duration: const Duration(milliseconds: 300),
//           child: lang == null
//               ? const LanguageGrid()
//               : const LanguageDetailPanel(),
//         );
//       },
//     );
//   }
// }
