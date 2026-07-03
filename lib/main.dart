import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/features/home/pages/home_page.dart';
import 'package:portfolio/theme/app_theme.dart';
import 'package:portfolio/theme/controller/theme_controller.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final controller = ThemeController();
  await controller.initialize();

  runApp(
    ChangeNotifierProvider(
      create: (_) => controller,
      child: const PortfolioApp(),
    ),
  );
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ThemeController>();
    final config = AppTheme.resolve(controller.currentTheme);

    return MaterialApp(
      theme: config.theme,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
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
