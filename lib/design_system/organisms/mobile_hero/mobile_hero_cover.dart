import 'package:flutter/material.dart';

class MobileHeroCover extends StatelessWidget {
  const MobileHeroCover({super.key});

  static const _maxHeight = 620.0;
  static const _minHeight = 110.0;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: _maxHeight,
      pinned: true,
      stretch: true,
      backgroundColor: const Color(0xFF0B0A14),
      elevation: 0,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final h = constraints.biggest.height;
          final double progress = ((h - _minHeight) / (_maxHeight - _minHeight))
              .clamp(0.0, 1.0)
              .toDouble();

          return Stack(
            fit: StackFit.expand,
            children: [
              // --- Background image with subtle zoom-out as it collapses ---
              Transform.scale(
                scale: 1.06 - progress * 0.06,
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(28 * progress),
                  ),
                  child: Image.asset(
                    "assets/images/andre.webp",
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // --- Multi-stop gradient for legibility + brand tint ---
              ClipRRect(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(28 * progress),
                ),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [0.0, 0.45, 0.75, 1.0],
                      colors: [
                        const Color(0xFF0B0A14).withValues(alpha: 0.55),
                        Colors.transparent,
                        const Color(0xFF0B0A14).withValues(alpha: 0.75),
                        const Color(0xFF0B0A14),
                      ],
                    ),
                  ),
                ),
              ),

              // --- Soft indigo-violet glow accent, top-left ---
              Positioned(
                top: -60,
                left: -40,
                child: Opacity(
                  opacity: 0.35 * progress,
                  child: Container(
                    width: 220,
                    height: 220,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [Color(0xFF6C5CE7), Colors.transparent],
                      ),
                    ),
                  ),
                ),
              ),

              // --- Top safe-area row: collapsed-state title fades in ---
              SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  child: Opacity(
                    opacity: 1 - progress,
                    child: const Text(
                      "ANDREAS TIRTA SANJAYA",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.4,
                      ),
                    ),
                  ),
                ),
              ),

              // --- Expanded-state content block ---
              Positioned(
                left: 24,
                right: 24,
                bottom: 32 + (1 - progress) * -16,
                child: Opacity(
                  opacity: progress,
                  child: Transform.translate(
                    offset: Offset(0, (1 - progress) * 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Eyebrow chip
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.08),
                            borderRadius: BorderRadius.circular(999),
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.14),
                            ),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.bolt_rounded,
                                size: 14,
                                color: Color(0xFFB9A6FF),
                              ),
                              SizedBox(width: 6),
                              Text(
                                "FLUTTER ENGINEER",
                                style: TextStyle(
                                  color: Color(0xFFB9A6FF),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Name — display type, tight leading, gradient wordmark
                        ShaderMask(
                          shaderCallback: (rect) => const LinearGradient(
                            colors: [Colors.white, Color(0xFFD8CCFF)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ).createShader(rect),
                          child: const Text(
                            "ANDREAS",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 44,
                              fontWeight: FontWeight.w800,
                              height: 1.0,
                              letterSpacing: -0.5,
                            ),
                          ),
                        ),
                        const Text(
                          "TIRTA SANJAYA",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w300,
                            height: 1.15,
                            letterSpacing: 1.5,
                          ),
                        ),

                        const SizedBox(height: 14),

                        // Divider + supporting line
                        Row(
                          children: [
                            Container(
                              width: 28,
                              height: 2,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF6C5CE7),
                                    Color(0xFFB9A6FF),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "Mobile · Flutter · Supabase",
                              style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.65),
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.2,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
