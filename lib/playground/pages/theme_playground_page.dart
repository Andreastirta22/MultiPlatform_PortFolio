import 'package:flutter/material.dart';
import 'package:portfolio/playground/widgets/button_showcase.dart';
import 'package:portfolio/playground/widgets/card_showcase.dart';
import 'package:portfolio/playground/widgets/colors_showcase.dart';
import 'package:portfolio/playground/widgets/radius_showcase.dart';
import 'package:portfolio/playground/widgets/spacing_showcase.dart';
import 'package:portfolio/playground/widgets/typography_showcase.dart';

class ThemePlaygroundPage extends StatelessWidget {
  const ThemePlaygroundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Theme Playground")),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: const [
          SizedBox(height: 24),
          ColorShowcase(),
          SizedBox(height: 46),
          TypographyShowcase(),
          SizedBox(height: 46),
          SpacingShowcase(),
          SizedBox(height: 46),
          RadiusShowcase(),
          SizedBox(height: 46),
          ButtonShowcase(),
          SizedBox(height: 46),
          CardShowcase(),
        ],
      ),
    );
  }
}
