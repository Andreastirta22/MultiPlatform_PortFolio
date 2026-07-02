import 'package:flutter/material.dart';
import 'package:portfolio/features/experience/models/experience_model.dart';

class ExperienceCard extends StatefulWidget {
  final ExperienceModel item;
  final bool isActive;

  const ExperienceCard({super.key, required this.item, required this.isActive});

  @override
  State<ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<ExperienceCard> {
  bool _hover = false;

  void _setHover(bool value) {
    if (!mounted) return;
    setState(() => _hover = value);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final accent = theme.colorScheme.primary;

    final isActiveOrHover = widget.isActive || _hover;

    return MouseRegion(
      onEnter: (_) => _setHover(true),
      onExit: (_) => _setHover(false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeInOut,
        margin: const EdgeInsets.only(bottom: 28),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: isActiveOrHover
                ? accent.withValues(alpha: 0.35)
                : Colors.white.withValues(alpha: 0.06),
          ),
          boxShadow: isActiveOrHover
              ? [
                  BoxShadow(
                    color: accent.withValues(alpha: 0.18),
                    blurRadius: 24,
                    offset: const Offset(0, 10),
                  ),
                ]
              : [],
        ),

        /// 🔥 FIX: safer transform (less layout bug)
        child: AnimatedScale(
          duration: const Duration(milliseconds: 220),
          scale: widget.isActive ? 1.01 : (_hover ? 1.0 : 1.0),
          child: AnimatedSlide(
            duration: const Duration(milliseconds: 220),
            offset: _hover ? const Offset(0, -0.02) : Offset.zero,
            child: _buildContent(theme, accent),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(ThemeData theme, Color accent) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// HEADER
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.item.role,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.item.company,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.textTheme.bodySmall?.color?.withValues(
                        alpha: 0.6,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: accent.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(999),
              ),
              child: Text(
                widget.item.type.toUpperCase(),
                style: TextStyle(
                  fontSize: 11,
                  color: accent,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        /// DESCRIPTION
        Text(
          widget.item.description,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.bodyMedium?.copyWith(
            height: 1.5,
            color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.75),
          ),
        ),

        const SizedBox(height: 16),

        /// HIGHLIGHTS
        ...widget.item.highlights.map(
          (e) => Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.bolt_rounded,
                  size: 14,
                  color: accent.withValues(alpha: 0.8),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    e,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.textTheme.bodySmall?.color?.withValues(
                        alpha: 0.65,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
