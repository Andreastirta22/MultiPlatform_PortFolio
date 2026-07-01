import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/features/home/pages/home_page.dart';
import 'package:portfolio/theme/app_theme.dart';
import 'package:portfolio/theme/controller/theme_controller.dart';
import 'package:portfolio/theme/theme_scope.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final controller = ThemeController();
  await controller.initialize();
  ThemeScope.controller = controller;

  runApp(PortfolioApp(controller: controller));
}

class PortfolioApp extends StatelessWidget {
  final ThemeController controller;

  const PortfolioApp({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, _) {
        final config = AppTheme.resolve(controller.currentTheme);
        return MaterialApp(
          scrollBehavior: MyBehavior(),
          debugShowCheckedModeBanner: false,
          theme: config.theme,
          home: const HomePage(),
        );
      },
    );
  }
}

class MyBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.trackpad,
    PointerDeviceKind.stylus,
  };
}
