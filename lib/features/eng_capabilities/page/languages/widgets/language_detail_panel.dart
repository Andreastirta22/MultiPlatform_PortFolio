import 'package:flutter/material.dart';
import 'package:portfolio/core/extension/theme_extension.dart';
import 'package:provider/provider.dart';

import '../controller/engineering_language_controller.dart';

class LanguageDetailPanel extends StatelessWidget {
  const LanguageDetailPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<EngineeringLanguageController>(
      builder: (context, controller, _) {
        final language = controller.selectedLanguage;
        if (language == null) {
          return const _EmptyState();
        }

        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 350),
          switchInCurve: Curves.easeOutCubic,
          switchOutCurve: Curves.easeInCubic,

          child: Padding(
            key: ValueKey(language.id),
            padding: const EdgeInsets.all(24),

            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Header(language: language),
                  const SizedBox(height: 16),

                  _InsightCard(language: language),
                  const SizedBox(height: 20),

                  _MetricsRow(language: language),
                  const SizedBox(height: 20),

                  _ConfidenceEngine(confidence: language.confidence),
                  const SizedBox(height: 20),

                  _PlatformSection(language: language),
                  const SizedBox(height: 20),

                  _ProjectSection(language: language),
                  const SizedBox(height: 20),

                  _TagSection(language: language),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Header extends StatelessWidget {
  final dynamic language;

  const _Header({required this.language});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: colors.textPrimary.withValues(alpha: 0.05),
          ),
          child: Center(
            child: Image.asset(language.iconAsset, width: 24, height: 24),
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                language.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                language.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12,
                  height: 1.4,
                  color: colors.textPrimary.withValues(alpha: 0.5),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.blueAccent.withValues(alpha: 0.12),
          ),
          child: Text(language.level, style: const TextStyle(fontSize: 11)),
        ),
      ],
    );
  }
}

class _InsightCard extends StatelessWidget {
  final dynamic language;

  const _InsightCard({required this.language});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: colors.background.withValues(alpha: 0.03),
        border: Border.all(color: colors.surface.withValues(alpha: 0.05)),
      ),
      child: Text(
        "Specialized in building production-ready systems using ${language.name}, focusing on scalable architecture, maintainability, and real-world application design.",
        style: TextStyle(
          fontSize: 12,
          height: 1.5,
          color: colors.textPrimary.withValues(alpha: 0.65),
        ),
      ),
    );
  }
}

class _MetricsRow extends StatelessWidget {
  final dynamic language;

  const _MetricsRow({required this.language});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _Metric("Experience", "${language.yearsExperience}y"),
        const SizedBox(width: 24),
        _Metric("Projects", "${language.linkedProjects.length}"),
      ],
    );
  }
}

class _Metric extends StatelessWidget {
  final String label;
  final String value;

  const _Metric(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: colors.textPrimary.withValues(alpha: 0.4),
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

class _ConfidenceEngine extends StatelessWidget {
  final double confidence;

  const _ConfidenceEngine({required this.confidence});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Proficiency",
          style: TextStyle(
            fontSize: 12,
            color: colors.textPrimary.withValues(alpha: 0.5),
          ),
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(999),
          child: TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: confidence / 100),
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeOutCubic,
            builder: (context, value, _) {
              return LinearProgressIndicator(
                value: value,
                minHeight: 6,
                backgroundColor: colors.textPrimary.withValues(alpha: 0.05),
                valueColor: const AlwaysStoppedAnimation(Color(0xFF6C63FF)),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _PlatformSection extends StatelessWidget {
  final dynamic language;

  const _PlatformSection({required this.language});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: language.platforms.map<Widget>((p) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: colors.textPrimary.withValues(alpha: 0.04),
          ),
          child: Text(
            p.toString().split('.').last,
            style: TextStyle(
              fontSize: 11,
              color: colors.textPrimary.withValues(alpha: 0.7),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _ProjectSection extends StatelessWidget {
  final dynamic language;

  const _ProjectSection({required this.language});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: language.linkedProjects.map<Widget>((p) {
        return Chip(label: Text(p));
      }).toList(),
    );
  }
}

class _TagSection extends StatelessWidget {
  final dynamic language;

  const _TagSection({required this.language});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 6,
      runSpacing: 6,
      children: language.tags.map<Widget>((tag) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white.withValues(alpha: 0.03),
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

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    final accent = const Color(0xFF6C63FF);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: accent.withValues(alpha: 0.08),
              boxShadow: [
                BoxShadow(
                  color: accent.withValues(alpha: 0.12),
                  blurRadius: 20,
                ),
              ],
            ),
            child: Icon(
              Icons.touch_app_rounded,
              size: 28,
              color: accent.withValues(alpha: 0.9),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "Select a Language",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white.withValues(alpha: 0.85),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            "Click a card to explore details",
            style: TextStyle(
              fontSize: 12,
              color: Colors.white.withValues(alpha: 0.45),
            ),
          ),
        ],
      ),
    );
  }
}
