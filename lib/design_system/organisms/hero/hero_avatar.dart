import 'package:flutter/material.dart';
import 'package:portfolio/core/extension/responsive_extension.dart';
import 'package:portfolio/core/extension/theme_extension.dart';

class HeroAvatar extends StatelessWidget {
  final String image;
  final double? size;

  const HeroAvatar({super.key, required this.image, this.size});

  @override
  Widget build(BuildContext context) {
    final radius = context.radius;
    final colors = context.colors;
    final avatarSize =
        size ??
        (context.isPhone
            ? 220
            : context.isTablet
            ? 300
            : 420);

    return Container(
      width: avatarSize,
      height: avatarSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius.extraLarge),
        border: Border.all(color: colors.border),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius.extraLarge),
        child: Image.asset(image, fit: BoxFit.cover),
      ),
    );
  }
}
