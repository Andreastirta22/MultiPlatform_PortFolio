import 'package:flutter/material.dart';
import 'package:portfolio/features/experience_banner/models/experience_banner_model.dart';

class MinimalExperienceBanner extends StatelessWidget {
  final ExperienceBannerModel data;
  final VoidCallback? onOpen;

  const MinimalExperienceBanner({super.key, required this.data, this.onOpen});

  bool _isMobile(double w) => w < 768;
  bool _isTablet(double w) => w >= 768 && w < 1024;
  bool _isDesktop(double w) => w >= 1024;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;

    final isMobile = _isMobile(w);
    final isTablet = _isTablet(w);
    final isDesktop = _isDesktop(w);

    final height = isMobile
        ? 420.0
        : isTablet
        ? 480.0
        : 560.0;

    final titleSize = isMobile
        ? 22.0
        : isTablet
        ? 26.0
        : 30.0;

    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: Colors.black12),
        color: Colors.white,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // =========================
            // IMAGE
            // =========================
            Image.network(
              data.image,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(color: Colors.black12),
            ),

            // =========================
            // GRADIENT OVERLAY
            // =========================
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.25),
                    Colors.black.withValues(alpha: 0.85),
                  ],
                ),
              ),
            ),

            // =========================
            // TOP META
            // =========================
            Positioned(
              top: isDesktop ? 22 : 16,
              left: isDesktop ? 22 : 16,
              child: _pill(data.role),
            ),

            Positioned(
              top: isDesktop ? 22 : 16,
              right: isDesktop ? 22 : 16,
              child: Text(
                data.year,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.75),
                  fontSize: isDesktop ? 13 : 12,
                  letterSpacing: 2.5,
                ),
              ),
            ),

            // =========================
            // CONTENT
            // =========================
            Positioned(
              left: isDesktop ? 28 : 20,
              right: isDesktop ? 28 : 20,
              bottom: isDesktop ? 26 : 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // TITLE
                  Text(
                    data.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: titleSize,
                      fontWeight: FontWeight.w500,
                      height: 1.25,
                      letterSpacing: -0.2,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // IMPACT
                  Text(
                    data.impact,
                    maxLines: isMobile ? 3 : 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.72),
                      fontSize: isDesktop ? 14 : 13,
                      height: 1.6,
                    ),
                  ),

                  const SizedBox(height: 14),

                  // META
                  Row(
                    children: [
                      Text(
                        data.team.toUpperCase(),
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.65),
                          fontSize: 11,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        width: 3,
                        height: 3,
                        decoration: const BoxDecoration(
                          color: Colors.white24,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        data.scale.toUpperCase(),
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.65),
                          fontSize: 11,
                          letterSpacing: 2,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // CTA
                  _minimalCta(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // =========================
  // CTA
  // =========================
  Widget _minimalCta() {
    return InkWell(
      onTap: onOpen,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "View Experience",
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.8),
              fontSize: 12.5,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(width: 6),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 12,
            color: Colors.white.withValues(alpha: 0.6),
          ),
        ],
      ),
    );
  }

  Widget _pill(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.35),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.white12),
      ),
      child: Text(
        text.toUpperCase(),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
          letterSpacing: 2,
        ),
      ),
    );
  }
}
