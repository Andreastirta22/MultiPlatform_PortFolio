import 'dart:math';

import 'package:flutter/material.dart';

class MapFoldCard extends StatelessWidget {
  final double progress;
  final Widget child;

  const MapFoldCard({super.key, required this.progress, required this.child});

  @override
  Widget build(BuildContext context) {
    final p = progress.clamp(0.0, 1.0);
    final angle = (1 - p) * pi / 2;

    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Stack(
        children: [
          // 🔥 BASE LAYER (full static map)
          child,

          // 🔥 TOP FOLD (ONLY VISUAL LAYER, NO DUPLICATE CONTENT OVERLAY)
          Align(
            alignment: Alignment.topCenter,
            child: ClipRect(
              child: Align(
                alignment: Alignment.topCenter,
                heightFactor: 0.5,
                child: Transform(
                  alignment: Alignment.bottomCenter,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateX(-angle),
                  child: Container(
                    // ⭐ KEY FIX: jangan pakai child langsung
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    child: child,
                  ),
                ),
              ),
            ),
          ),

          // 🔥 FOLD SHADOW (depth cue)
          Positioned.fill(
            child: IgnorePointer(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.center,
                    colors: [
                      Colors.black.withValues(alpha: .25 * (1 - p)),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
