import 'package:flutter/material.dart';
import 'package:portfolio/features/eng_capabilities/page/languages/models/engineering_languages_models.dart';

class LanguageCard extends StatefulWidget {
  final LanguageModel language;
  final bool isSelected;
  final VoidCallback onTap;

  const LanguageCard({
    super.key,
    required this.language,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<LanguageCard> createState() => _LanguageCardState();
}

class _LanguageCardState extends State<LanguageCard> {
  bool _hovered = false;
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final accent = const Color(0xFF6C63FF);
    final isActive = widget.isSelected;

    final scale = _pressed
        ? 0.97
        : isActive
        ? 1.03
        : _hovered
        ? 1.015
        : 1.0;

    final translateY = _hovered ? -2.0 : 0.0;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _pressed = true),
        onTapUp: (_) {
          setState(() => _pressed = false);
          widget.onTap();
        },
        onTapCancel: () => setState(() => _pressed = false),

        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOutCubic,

          padding: const EdgeInsets.all(16),

          // ✅ CLEAN TRANSFORM (NO Matrix4)
          child: Transform.translate(
            offset: Offset(0, translateY),

            child: Transform.scale(
              scale: scale,

              child: _CardBody(
                language: widget.language,
                isActive: isActive,
                accent: accent,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final LanguageModel language;
  final Color accent;
  final bool isActive;

  const _Header({
    required this.language,
    required this.accent,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: isActive
                ? accent.withValues(alpha: 0.15)
                : Colors.white.withValues(alpha: 0.05),
          ),
          child: Image.asset(language.iconAsset, width: 18, height: 18),
        ),

        const SizedBox(width: 10),

        Expanded(
          child: Text(
            language.name,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.white.withValues(alpha: 0.9),
              letterSpacing: 0.2,
            ),
          ),
        ),
      ],
    );
  }
}

class _CardBody extends StatelessWidget {
  final LanguageModel language;
  final bool isActive;
  final Color accent;

  const _CardBody({
    required this.language,
    required this.isActive,
    required this.accent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),

        border: Border.all(
          color: isActive
              ? accent.withValues(alpha: 0.6)
              : Colors.white.withValues(alpha: 0.06),
          width: isActive ? 1.4 : 1,
        ),

        color: isActive
            ? accent.withValues(alpha: 0.06)
            : Colors.white.withValues(alpha: 0.02),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
          if (isActive)
            BoxShadow(
              color: accent.withValues(alpha: 0.18),
              blurRadius: 26,
              spreadRadius: 1,
            ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Header(language: language, accent: accent, isActive: isActive),

          const SizedBox(height: 14),

          _Tags(tags: language.tags),

          const SizedBox(height: 10),

          AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: isActive ? 1 : 0.6,
            child: Text(
              language.level,
              style: TextStyle(
                fontSize: 12,
                color: Colors.white.withValues(alpha: 0.45),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Tags extends StatelessWidget {
  final List<String> tags;

  const _Tags({required this.tags});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 6,
      runSpacing: 6,
      children: tags.take(3).map((tag) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white.withValues(alpha: 0.04),
            border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
          ),
          child: Text(
            tag,
            style: TextStyle(
              fontSize: 11,
              color: Colors.white.withValues(alpha: 0.6),
            ),
          ),
        );
      }).toList(),
    );
  }
}
