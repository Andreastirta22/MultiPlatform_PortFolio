import 'package:flutter/material.dart';
import 'package:portfolio/features/experience_banner/models/experience_banner_model.dart';

class XPExperienceBanner extends StatelessWidget {
  final ExperienceBannerModel data;
  final VoidCallback? onOpen;

  const XPExperienceBanner({super.key, required this.data, this.onOpen});

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
        ? 460.0
        : isTablet
        ? 520.0
        : 580.0;

    final titleSize = isMobile
        ? 22.0
        : isTablet
        ? 24.0
        : 26.0;

    return Container(
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xffECE9D8),
        border: Border.all(color: const Color(0xff0A246A), width: 2),
      ),
      child: Column(
        children: [
          // =========================
          // XP TITLE BAR
          // =========================
          Container(
            height: 42,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xff1E3A8A), Color(0xff0A246A)],
              ),
              border: Border(
                bottom: BorderSide(color: Color(0xff001A44), width: 2),
              ),
            ),
            child: Row(
              children: [
                const Icon(Icons.work, size: 18, color: Colors.white),
                const SizedBox(width: 8),

                Expanded(
                  child: Text(
                    data.role.toUpperCase(),
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.25),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Text(
                    data.year,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // =========================
          // CONTENT
          // =========================
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                // IMAGE
                Image.network(
                  data.image,
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                  errorBuilder: (context, error, stackTrace) =>
                      const ColoredBox(color: Colors.black),
                ),

                // OVERLAY
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withValues(alpha: 0.25),
                        Colors.black.withValues(alpha: 0.75),
                      ],
                      stops: const [0.0, 0.5, 1.0],
                    ),
                  ),
                ),

                // CONTENT
                Positioned(
                  left: isDesktop ? 24 : 16,
                  right: isDesktop ? 24 : 16,
                  bottom: isDesktop ? 20 : 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        data.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: titleSize,
                          fontWeight: FontWeight.w800,
                          height: 1.1,
                        ),
                      ),

                      const SizedBox(height: 6),

                      Text(
                        data.impact,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.9),
                          fontSize: 13,
                          height: 1.3,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: [
                          _chipOverlay(data.team),
                          _chipOverlay(data.scale),
                        ],
                      ),

                      const SizedBox(height: 12),

                      // CTA (NOW FUNCTIONAL)
                      _cta(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // =========================
  // CTA FIXED
  // =========================
  Widget _cta() {
    return InkWell(
      onTap: onOpen,
      child: Container(
        height: 38,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xffD7E6FF),
          border: Border.all(color: const Color(0xff5A7DB8), width: 1),
          boxShadow: const [
            BoxShadow(color: Colors.white24, offset: Offset(-1, -1)),
          ],
        ),
        child: const Text(
          "OPEN EXPERIENCE",
          style: TextStyle(
            fontSize: 12.5,
            fontWeight: FontWeight.w700,
            color: Color(0xff001A44),
          ),
        ),
      ),
    );
  }

  Widget _chipOverlay(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.35),
        border: Border.all(color: Colors.white.withValues(alpha: 0.5)),
      ),
      child: Text(
        text.toUpperCase(),
        style: const TextStyle(
          fontSize: 10.5,
          fontWeight: FontWeight.w600,
          color: Colors.white,
          letterSpacing: 0.3,
        ),
      ),
    );
  }
}
