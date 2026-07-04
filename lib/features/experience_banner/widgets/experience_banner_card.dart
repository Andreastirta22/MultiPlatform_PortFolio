import 'package:flutter/material.dart';
import 'package:portfolio/features/experience_banner/models/experience_banner_model.dart';
import 'package:portfolio/theme/components/experience_banner_card/experience_banner_factory_card.dart';
import 'package:portfolio/theme/theme_mode.dart';

class ExperienceBannerCard extends StatelessWidget {
  final ExperienceBannerModel data;
  final PortfolioTheme theme;

  const ExperienceBannerCard({
    super.key,
    required this.data,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: ValueKey(theme),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: ExperienceBannerFactoryCard.build(
        context: context,
        data: data,
        theme: theme,
      ),
    );
  }
}
