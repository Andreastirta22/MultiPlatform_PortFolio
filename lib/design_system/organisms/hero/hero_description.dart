import 'package:flutter/material.dart';
import 'package:portfolio/core/extension/theme_extension.dart';

class HeroDescription extends StatelessWidget {
  final String text;

  const HeroDescription({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: context.typography.body, height: 1.7),
    );
  }
}
