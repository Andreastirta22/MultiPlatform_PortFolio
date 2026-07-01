import 'package:flutter/material.dart';
import 'package:portfolio/core/extension/responsive_extension.dart';
import 'package:portfolio/core/extension/theme_extension.dart';

extension ResponsiveTypography on BuildContext {
  double get haroDisplay {
    if (isPhone) return 40;
    if (isTablet) return 48;
    return typography.display;
  }

  double get heroHeadline {
    if (isPhone) return 22;
    if (isTablet) return 28;
    return typography.headline;
  }
}
