import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/core/extension/theme_extension.dart';
import 'package:portfolio/features/architecture/data/archtecture_data.dart';
import 'package:portfolio/features/architecture/models/architecture_node.dart';
import 'package:portfolio/features/architecture/models/architecture_node_card.dart';
import 'package:portfolio/features/architecture/presentation/widgets/stack_reveal_card.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ArchitectureFlow extends StatelessWidget {
  const ArchitectureFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(architectureNodes.length, (index) {
        final node = architectureNodes[index];

        return ArchitectureFlowItem(
          node: node,
          index: index,
          last: index == architectureNodes.length - 1,
        );
      }),
    );
  }
}

class ArchitectureFlowItem extends StatefulWidget {
  final ArchitectureNode node;
  final bool last;
  final int index;

  const ArchitectureFlowItem({
    super.key,
    required this.node,
    required this.last,
    required this.index,
  });

  @override
  State<ArchitectureFlowItem> createState() => _ArchitectureFlowItemState();
}

class _ArchitectureFlowItemState extends State<ArchitectureFlowItem> {
  double progress = 0;
  bool _isDisposed = false;

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.node.title),

      onVisibilityChanged: (info) {
        if (!mounted || _isDisposed) return;

        final p = info.visibleFraction.clamp(0.0, 1.0);

        if ((p - progress).abs() > 0.02) {
          setState(() => progress = p);
        }
      },

      child: Transform.translate(
        offset: Offset(0, lerpDouble(40, 0, progress)!),

        child: Opacity(
          opacity: lerpDouble(0.4, 1, progress)!,

          child: Transform.scale(
            scale: lerpDouble(0.94, 1, progress)!,

            child: Column(
              children: [
                StackRevealCard(
                  progress: progress,
                  child: ArchitectureNodeCard(node: widget.node),
                ),

                if (!widget.last)
                  Connector(index: widget.index, active: progress > .75),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Connector extends StatelessWidget {
  final int index;
  final bool active;
  const Connector({super.key, required this.index, required this.active});

  @override
  Widget build(BuildContext context) {
    final accent = context.colors.accent;
    return TweenAnimationBuilder<double>(
      duration: Duration(milliseconds: 900 + index * 120),
      tween: Tween(begin: 0, end: 1),
      curve: Curves.easeOutCubic,
      builder: (_, value, _) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: SizedBox(
            height: 48,
            child: Column(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: active ? accent : accent.withValues(alpha: .25),
                  ),
                ),
                const SizedBox(height: 6),
                Expanded(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 2,
                      height: 42 * value,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(999),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            active ? accent : accent.withValues(alpha: .2),
                            active
                                ? accent.withValues(alpha: .08)
                                : Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
