import 'package:flutter/material.dart';
import 'package:portfolio/features/experience_banner/controller/experience_banner_controller.dart';
import 'package:portfolio/features/experience_banner/data/experience_banner_data.dart';
import 'package:portfolio/features/experience_banner/widgets/experience_banner_card.dart';
import 'package:portfolio/theme/controller/theme_controller.dart';
import 'package:provider/provider.dart';

class ExperienceBannerSection extends StatefulWidget {
  final ThemeController themeController;

  const ExperienceBannerSection({super.key, required this.themeController});

  @override
  State<ExperienceBannerSection> createState() =>
      _ExperienceBannerSectionState();
}

class _ExperienceBannerSectionState extends State<ExperienceBannerSection> {
  late final ExperienceBannerController controller;
  bool _isDisposed = false;

  @override
  void initState() {
    super.initState();
    controller = ExperienceBannerController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      if (_isDisposed) return;

      controller.startAutoPlay(experienceBannerDummy.length);
    });
  }

  @override
  void dispose() {
    _isDisposed = true;
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeController = context.watch<ThemeController>();

    return AnimatedBuilder(
      animation: controller.activeIndex,
      builder: (context, _) {
        final items = experienceBannerDummy;
        final theme = themeController.currentTheme;

        return SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.85,
          child: PageView.builder(
            controller: controller.pageController,
            physics: const BouncingScrollPhysics(),
            onPageChanged: (page) {
              controller.onPageChangedLocal(page, items.length);
            },
            itemBuilder: (context, index) {
              final item = items[index % items.length];

              return ExperienceBannerCard(
                key: ValueKey('${theme.name}_${item.id}'),
                data: item,
                theme: theme,
              );
            },
          ),
        );
      },
    );
  }
}
