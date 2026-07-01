import 'package:flutter/material.dart';
import 'package:portfolio/core/extension/theme_extension.dart';

class NavLogo extends StatelessWidget {
  const NavLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset('assets/logos/logo.png', height: 42),
        Text("|", style: TextStyle(color: colors.border)),
        const SizedBox(width: 10),
        Text(
          "ATS",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            letterSpacing: .5,
          ),
        ),
      ],
    );
  }
}
