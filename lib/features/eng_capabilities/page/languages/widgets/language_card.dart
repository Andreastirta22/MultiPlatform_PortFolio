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

class _LanguageCardState extends State<LanguageCard>
    with SingleTickerProviderStateMixin {
  bool _hovered = false;
  bool _pressed = false;

  late AnimationController _glowController;

  @override
  void initState() {
    super.initState();
    _glowController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _glowController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _glowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final accent = const Color(0xFF6C63FF);
    final active = widget.isSelected;
    final scale = _pressed
        ? .96
        : active
        ? 1.035
        : _hovered
        ? 1.02
        : 1.0;

    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _hovered = true;
        });
      },

      onExit: (_) {
        setState(() {
          _hovered = false;
        });
      },

      child: GestureDetector(
        onTapDown: (_) {
          setState(() {
            _pressed = true;
          });
        },

        onTapUp: (_) {
          setState(() {
            _pressed = false;
          });
          widget.onTap();
        },

        onTapCancel: () {
          setState(() {
            _pressed = false;
          });
        },

        child: AnimatedScale(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOutCubic,
          scale: scale,

          child: AnimatedSlide(
            duration: const Duration(milliseconds: 250),
            offset: _hovered ? const Offset(0, -0.02) : Offset.zero,

            child: AnimatedBuilder(
              animation: _glowController,
              builder: (context, child) {
                return _CardBody(
                  language: widget.language,
                  isActive: active,
                  accent: accent,
                  glow: _glowController.value,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _CardBody extends StatelessWidget {
  final LanguageModel language;
  final bool isActive;
  final Color accent;
  final double glow;
  const _CardBody({
    required this.language,
    required this.isActive,
    required this.accent,
    required this.glow,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white.withValues(alpha: isActive ? .08 : .035),
            Colors.white.withValues(alpha: .015),
          ],
        ),

        border: Border.all(
          width: isActive ? 1.5 : 1,
          color: isActive
              ? accent.withValues(alpha: .65)
              : Colors.white.withValues(alpha: .08),
        ),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .35),
            blurRadius: 25,
            offset: const Offset(0, 15),
          ),
          if (isActive)
            BoxShadow(
              color: accent.withValues(alpha: .15 + glow * .12),
              blurRadius: 35,
              spreadRadius: 2,
            ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Header(language: language, accent: accent, isActive: isActive),
          const SizedBox(height: 16),
          _Tags(tags: language.tags),
          const SizedBox(height: 14),

          Text(
            language.level,
            style: TextStyle(
              fontSize: 12,
              letterSpacing: .8,
              color: Colors.white.withValues(alpha: .5),
            ),
          ),
        ],
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
        AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: isActive
                ? accent.withValues(alpha: .18)
                : Colors.white.withValues(alpha: .05),
          ),
          child: Image.asset(language.iconAsset, width: 22, height: 22),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            language.name,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: Colors.white.withValues(alpha: .95),
            ),
          ),
        ),
      ],
    );
  }
}

class _Tags extends StatelessWidget {
  final List<String> tags;
  const _Tags({required this.tags});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 7,
      runSpacing: 7,
      children: tags.take(3).map((tag) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white.withValues(alpha: .05),
            border: Border.all(color: Colors.white.withValues(alpha: .08)),
          ),
          child: Text(
            tag,
            style: TextStyle(
              fontSize: 11,
              color: Colors.white.withValues(alpha: .65),
            ),
          ),
        );
      }).toList(),
    );
  }
}
