import 'dart:math';

import 'package:flutter/material.dart';

class MapFoldCard extends StatelessWidget {
  final double progress;
  final Widget child;

  const MapFoldCard({super.key, required this.progress, required this.child});

  @override
  Widget build(BuildContext context) {
    final p = progress.clamp(0.0, 1.0);

    // 0 = folded, 1 = open
    final angle = (1 - p) * pi / 2;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Transform(
        alignment: Alignment.topCenter,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001) // perspective
          ..rotateX(-angle), // fold dari atas ke bawah
        child: child,
      ),
    );
  }
}
