import 'package:flutter/material.dart';

extension ResponsiveExtension on BuildContext {
  double get width => MediaQuery.sizeOf(this).width;

  bool get isPhone => width < 768;

  bool get isTablet => width >= 768 && width < 1200;

  bool get isDesktop => width >= 1200;

  bool get isWide => width >= 1440;

  double get gutter {
    if (isPhone) return 16;

    if (isTablet) return 24;

    return 32;
  }

  double get maxContentWidth {
    if (isWide) return 1440;

    if (isDesktop) return 1200;

    if (isTablet) return 960;

    return width;
  }
}
