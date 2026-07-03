import 'package:flutter/material.dart';
import 'package:portfolio/features/experience_banner/models/experience_banner_model.dart';

class DarkExperienceBanner extends StatefulWidget {
  final ExperienceBannerModel data;
  final VoidCallback? onOpen;

  const DarkExperienceBanner({super.key, required this.data, this.onOpen});

  @override
  State<DarkExperienceBanner> createState() => _DarkExperienceBannerState();
}

class _DarkExperienceBannerState extends State<DarkExperienceBanner> {
  bool hovered = false;

  void _setHover(bool value) {
    if (hovered == value) return;
    setState(() => hovered = value);
  }

  @override
  Widget build(BuildContext context) {
    final d = widget.data;
    final isMobile = MediaQuery.sizeOf(context).width < 768;

    return MouseRegion(
      onEnter: (_) => _setHover(true),
      onExit: (_) => _setHover(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 450),
        curve: Curves.easeOutCubic,
        height: isMobile ? 420 : 540,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(isMobile ? 24 : 36),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: hovered ? 0.65 : 0.45),
              blurRadius: hovered ? 80 : 55,
              offset: const Offset(0, 30),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(isMobile ? 24 : 36),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // =========================
              // BACKGROUND IMAGE
              // =========================
              AnimatedScale(
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeOutCubic,
                scale: hovered ? 1.06 : 1.0,
                child: Image.network(d.image, fit: BoxFit.cover),
              ),

              // =========================
              // CINEMATIC OVERLAY
              // =========================
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withValues(alpha: 0.10),
                      Colors.black.withValues(alpha: 0.45),
                      Colors.black.withValues(alpha: 0.88),
                    ],
                  ),
                ),
              ),

              // VIGNETTE
              Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment.center,
                    radius: 1.2,
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.30),
                    ],
                  ),
                ),
              ),

              // =========================
              // BIG INDEX
              // =========================
              Positioned(
                right: 16,
                top: 10,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: hovered ? 0.14 : 0.09,
                  child: Text(
                    d.index,
                    style: TextStyle(
                      fontSize: isMobile ? 90 : 120,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              // =========================
              // CONTENT
              // =========================
              Positioned(
                left: 24,
                right: 24,
                bottom: 28,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // YEAR + ROLE
                    Row(
                      children: [
                        Text(
                          d.year,
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.70),
                            fontSize: 12,
                            letterSpacing: 2.2,
                          ),
                        ),
                        const SizedBox(width: 10),
                        _glassTag(d.role),
                      ],
                    ),

                    const SizedBox(height: 10),

                    // TITLE
                    Text(
                      d.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: isMobile ? 22 : 30,
                        fontWeight: FontWeight.w700,
                        height: 1.15,
                        letterSpacing: -0.3,
                      ),
                    ),

                    const SizedBox(height: 8),

                    // IMPACT
                    Text(
                      d.impact,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.72),
                        fontSize: 14,
                        height: 1.55,
                      ),
                    ),

                    const SizedBox(height: 14),

                    // META
                    Wrap(
                      spacing: 8,
                      runSpacing: 6,
                      children: [_chip(d.team), _chip(d.scale)],
                    ),

                    const SizedBox(height: 18),

                    // =========================
                    // CTA (FINAL)
                    // =========================
                    _cta(),
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
  // CTA BUTTON
  // =========================
  Widget _cta() {
    return InkWell(
      onTap: widget.onOpen,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.06),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white.withValues(alpha: 0.10)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              "OPEN EXPERIENCE",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.5,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.1,
              ),
            ),
            SizedBox(width: 8),
            Icon(Icons.arrow_forward_rounded, size: 16, color: Colors.white),
          ],
        ),
      ),
    );
  }

  Widget _glassTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.07),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.white.withValues(alpha: 0.10)),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
          letterSpacing: 1.1,
        ),
      ),
    );
  }

  Widget _chip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white.withValues(alpha: 0.75),
          fontSize: 11,
          letterSpacing: 0.8,
        ),
      ),
    );
  }
}
