import 'package:flutter/material.dart';
import 'package:portfolio/features/home/pages/home_page.dart';
import 'package:portfolio/theme/app_theme.dart';
import 'package:portfolio/theme/controller/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final controller = ThemeController();

  await controller.initialize();

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
          debugShowCheckedModeBanner: false,
          theme: config.theme,
          home: const HomePage(),
        );
      },
    );
  }
}
