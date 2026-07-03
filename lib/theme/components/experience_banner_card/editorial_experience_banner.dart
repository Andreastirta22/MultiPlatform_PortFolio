import 'package:flutter/material.dart';
import 'package:portfolio/core/extension/theme_extension.dart';
import 'package:portfolio/features/experience_banner/models/experience_banner_model.dart';

class EditorialExperienceBanner extends StatelessWidget {
  final ExperienceBannerModel data;
  final VoidCallback? onOpen;

  const EditorialExperienceBanner({super.key, required this.data, this.onOpen});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      height: 520,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: colors.border),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // =====================
            // IMAGE
            // =====================
            Image.network(
              data.image,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(color: Colors.black12),
            ),

            // =====================
            // OVERLAY (EDITORIAL DEPTH)
            // =====================
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.1),
                    Colors.black.withValues(alpha: 0.55),
                    Colors.black.withValues(alpha: 0.9),
                  ],
                ),
              ),
            ),

            // =====================
            // TOP BADGES
            // =====================
            Positioned(top: 16, left: 16, child: _Badge(text: data.role)),

            Positioned(top: 16, right: 16, child: _Badge(text: data.year)),

            // =====================
            // CONTENT BLOCK
            // =====================
            Positioned(
              left: 20,
              right: 20,
              bottom: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // TITLE
                  Text(
                    data.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      height: 1.15,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.4,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // IMPACT
                  Text(
                    data.impact,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.85),
                      fontSize: 13,
                      height: 1.6,
                    ),
                  ),

                  const SizedBox(height: 14),

                  // META ROW (EDITORIAL ALIGNMENT)
                  Row(
                    children: [
                      Text(
                        data.team.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 11,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        width: 3,
                        height: 3,
                        decoration: const BoxDecoration(
                          color: Colors.white38,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        data.scale.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 11,
                          letterSpacing: 2,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // =====================
                  // CTA (EDITORIAL STYLE)
                  // =====================
                  _cta(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // =====================
  // CTA
  // =====================
  Widget _cta() {
    return InkWell(
      onTap: onOpen,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text(
            "Read Case Study",
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.5,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.3,
            ),
          ),
          SizedBox(width: 6),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 12,
            color: Colors.white70,
          ),
        ],
      ),
    );
  }
}

// =====================
// BADGE COMPONENT (REFINED)
// =====================
class _Badge extends StatelessWidget {
  final String text;

  const _Badge({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.45),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.white10),
      ),
      child: Text(
        text.toUpperCase(),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
          letterSpacing: 2,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
