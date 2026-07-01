import 'package:flutter/material.dart';
import 'package:portfolio/core/extension/theme_extension.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final color = context.colors;
    final radius = context.radius;

    return Container(
      height: 42,
      width: 42,
      decoration: BoxDecoration(
        color: color.surface,
        borderRadius: BorderRadius.circular(radius.full),
        border: Border.all(color: color.border),
      ),
      child: Icon(Icons.light_mode_outlined, size: 18),
    );
  }
}
