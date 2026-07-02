import 'dart:ui';

import 'package:flutter/material.dart';

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
          child: ClipRRect(
            borderRadius: BorderRadius.circular(radius),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
              child: Container(
                height: height,
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.06),
                  borderRadius: BorderRadius.circular(radius),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.18),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 40,
                      spreadRadius: -10,
                      offset: const Offset(0, 20),
                      color: Colors.black.withValues(alpha: 0.25),
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
                    const _Item(
                      icon: Icons.description_outlined,
                      label: "Resume",
                    ),
                    SizedBox(width: gap),
                    const _Item(
                      icon: Icons.mail_outline_rounded,
                      label: "Email",
                    ),
                  ],
                ),
              ),
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
        Icon(icon, size: 15, color: Colors.white12),
        const SizedBox(width: 7),
        Text(
          label,
          style: const TextStyle(
            fontSize: 13.5,
            fontWeight: FontWeight.w600,
            color: Colors.white24,
            letterSpacing: -.1,
          ),
        ),
      ],
    );
  }
}
