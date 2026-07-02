import 'dart:ui';

import 'package:flutter/material.dart';

class StackRevealCard extends StatelessWidget {
  final double progress;
  final Widget child;

  const StackRevealCard({
    super.key,
    required this.progress,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final p = progress.clamp(0.0, 1.0);
    final t = Curves.easeOutCubic.transform(p);

    final opacity = lerpDouble(0.4, 1.0, t)!;
    final scale = lerpDouble(0.92, 1.0, t)!;
    final translateY = lerpDouble(40, 0, t)!;

    return Transform.translate(
      offset: Offset(0, translateY),
      child: Opacity(
        opacity: opacity,
        child: Transform.scale(
          scale: scale,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOut,
            child: child,
          ),
        ),
      ),
    );
  }
}
