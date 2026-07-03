import 'package:flutter/material.dart';
import 'package:portfolio/features/experience_banner/models/experience_banner_model.dart';

class NeoExperienceBanner extends StatefulWidget {
  final ExperienceBannerModel data;

  const NeoExperienceBanner({super.key, required this.data});

  @override
  State<NeoExperienceBanner> createState() => _NeoExperienceBannerState();
}

class _NeoExperienceBannerState extends State<NeoExperienceBanner> {
  bool cardHovered = false;
  bool ctaHovered = false;

  @override
  Widget build(BuildContext context) {
    final d = widget.data;
    final isMobile = MediaQuery.sizeOf(context).width < 768;

    return MouseRegion(
      onEnter: (_) => setState(() => cardHovered = true),
      onExit: (_) => setState(() => cardHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOutCubic,
        height: isMobile ? 440 : 560,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xff070A12), Color(0xff0B0E17), Color(0xff0E111C)],
          ),
          border: Border.all(
            color: cardHovered
                ? const Color(0xff7C4DFF).withValues(alpha: 0.35)
                : Colors.white.withValues(alpha: 0.06),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.65),
              blurRadius: 70,
              offset: const Offset(0, 30),
            ),
            if (cardHovered)
              BoxShadow(
                color: const Color(0xff7C4DFF).withValues(alpha: 0.25),
                blurRadius: 90,
                spreadRadius: 1,
              ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(32),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // =========================
              // BACKGROUND IMAGE
              // =========================
              Positioned.fill(
                child: AnimatedScale(
                  duration: const Duration(milliseconds: 400),
                  scale: cardHovered ? 1.05 : 1.0,
                  child: Image.network(
                    d.image,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      color: const Color(0xff070A12),
                      child: const Icon(
                        Icons.broken_image,
                        color: Colors.white24,
                      ),
                    ),
                  ),
                ),
              ),

              // =========================
              // OVERLAY
              // =========================
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withValues(alpha: 0.2),
                        Colors.black.withValues(alpha: 0.55),
                        const Color(0xff070A12).withValues(alpha: 0.95),
                      ],
                    ),
                  ),
                ),
              ),

              // =========================
              // GLOW ORBS
              // =========================
              Positioned(
                top: -80,
                right: -60,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  width: cardHovered ? 260 : 220,
                  height: cardHovered ? 260 : 220,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        const Color(0xff7C4DFF).withValues(alpha: 0.25),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),

              Positioned(
                bottom: -100,
                left: -80,
                child: Container(
                  width: 280,
                  height: 280,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        const Color(0xff00FFF0).withValues(alpha: 0.15),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),

              // =========================
              // CONTENT
              // =========================
              Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          d.year,
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.6),
                            fontSize: 12,
                            letterSpacing: 2,
                          ),
                        ),
                        const SizedBox(width: 10),
                        _tag(d.role),
                      ],
                    ),

                    const Spacer(),

                    Text(
                      d.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: isMobile ? 28 : 34,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        height: 1.1,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      d.impact,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.5,
                        color: Colors.white.withValues(alpha: 0.7),
                      ),
                    ),

                    const SizedBox(height: 18),

                    Row(
                      children: [
                        _chip(d.team),
                        const SizedBox(width: 8),
                        _chip(d.scale),
                      ],
                    ),

                    const SizedBox(height: 22),

                    _neoCta(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // =========================
  // CTA (separate hover)
  // =========================
  Widget _neoCta() {
    return MouseRegion(
      onEnter: (_) => setState(() => ctaHovered = true),
      onExit: (_) => setState(() => ctaHovered = false),
      child: InkWell(
        onTap: () {
          // route modal
        },
        borderRadius: BorderRadius.circular(14),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: 44,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: ctaHovered
                  ? [
                      const Color(0xff7C4DFF).withValues(alpha: 0.9),
                      const Color(0xff00FFF0).withValues(alpha: 0.7),
                    ]
                  : [
                      const Color(0xff7C4DFF).withValues(alpha: 0.5),
                      const Color(0xff0B0E17),
                    ],
            ),
            border: Border.all(
              color: ctaHovered
                  ? const Color(0xff00FFF0).withValues(alpha: 0.5)
                  : Colors.white.withValues(alpha: 0.08),
            ),
            boxShadow: [
              if (ctaHovered)
                BoxShadow(
                  color: const Color(0xff7C4DFF).withValues(alpha: 0.35),
                  blurRadius: 25,
                  offset: const Offset(0, 10),
                ),
            ],
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "OPEN EXPERIENCE",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.5,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.2,
                ),
              ),
              SizedBox(width: 8),
              Icon(Icons.arrow_forward_rounded, size: 16, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: Text(
        text.toUpperCase(),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _chip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
      ),
      child: Text(
        text.toUpperCase(),
        style: TextStyle(
          fontSize: 11,
          color: Colors.white.withValues(alpha: 0.75),
          letterSpacing: 1,
        ),
      ),
    );
  }
}
