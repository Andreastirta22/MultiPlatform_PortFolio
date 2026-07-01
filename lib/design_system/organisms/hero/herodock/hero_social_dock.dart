import 'package:flutter/material.dart';

/// Floating social dock for [LargeHero].
///
/// Matches reference.png:
/// - centered horizontally, content-hugging width (NOT full width)
/// - matte white, pill shaped, soft shadow
/// - height 58 (tablet) / 60 (desktop)
/// - radius 30 (tablet) / 32 (desktop)
/// - items use intrinsic width + fixed gaps (NOT spaceEvenly)
class HeroSocialDock extends StatelessWidget {
  final bool isDesktop;

  const HeroSocialDock({super.key, this.isDesktop = true});

  @override
  Widget build(BuildContext context) {
    final height = isDesktop ? 60.0 : 58.0;
    final radius = isDesktop ? 32.0 : 30.0;
    final horizontalPadding = isDesktop ? 28.0 : 22.0;
    final gap = isDesktop ? 26.0 : 20.0;
    final maxWidth = isDesktop ? 520.0 : 440.0;

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: IntrinsicWidth(
          child: Container(
            height: height,
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            decoration: BoxDecoration(
              color: const Color(0xFFFAFAFA),
              borderRadius: BorderRadius.circular(radius),
              boxShadow: [
                BoxShadow(
                  blurRadius: 32,
                  spreadRadius: -4,
                  offset: const Offset(0, 12),
                  color: Colors.black.withValues(alpha: .18),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const _Item(icon: Icons.code_rounded, label: "Github"),
                SizedBox(width: gap),
                const _Item(
                  icon: Icons.work_outline_rounded,
                  label: "LinkedIn",
                ),
                SizedBox(width: gap),
                const _Item(icon: Icons.description_outlined, label: "Resume"),
                SizedBox(width: gap),
                const _Item(icon: Icons.mail_outline_rounded, label: "Email"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final IconData icon;
  final String label;

  const _Item({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 15, color: Colors.black87),
        const SizedBox(width: 7),
        Text(
          label,
          style: const TextStyle(
            fontSize: 13.5,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
            letterSpacing: -.1,
          ),
        ),
      ],
    );
  }
}
