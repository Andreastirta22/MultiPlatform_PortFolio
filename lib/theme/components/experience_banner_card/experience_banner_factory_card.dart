import 'package:flutter/material.dart';
import 'package:portfolio/features/experience_banner/models/experience_banner_model.dart';
import 'package:portfolio/theme/components/experience_banner_card/dark_experience_banner.dart';
import 'package:portfolio/theme/components/experience_banner_card/editorial_experience_banner.dart';
import 'package:portfolio/theme/components/experience_banner_card/minimal_experience_banner.dart';
import 'package:portfolio/theme/components/experience_banner_card/neo_experience_banner.dart';
import 'package:portfolio/theme/components/experience_banner_card/xp_experience_banner.dart';
import 'package:portfolio/theme/theme_mode.dart';

class ExperienceBannerFactoryCard {
  static Widget build({
    required BuildContext context,
    required ExperienceBannerModel data,
    required PortfolioTheme theme,
  }) {
    switch (theme) {
      case PortfolioTheme.dark:
        return DarkExperienceBanner(data: data);

      case PortfolioTheme.editorial:
        return EditorialExperienceBanner(data: data);

      case PortfolioTheme.minimal:
        return MinimalExperienceBanner(data: data);

      case PortfolioTheme.neo:
        return NeoExperienceBanner(data: data);

      case PortfolioTheme.xp:
        return XPExperienceBanner(data: data);
    }
  }
}
